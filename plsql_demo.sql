SET SERVEROUTPUT ON;

DECLARE
  -- Record for a single item
  TYPE item_rec IS RECORD (
    item_id   NUMBER,
    name      VARCHAR2(100),
    category  VARCHAR2(50),
    weight    NUMBER
  );

  -- Associative array of items
  TYPE item_table IS TABLE OF item_rec INDEX BY PLS_INTEGER;
  items item_table;

  -- Nested table for weights
  TYPE weight_list IS TABLE OF NUMBER;
  daily_weights weight_list := weight_list();

  -- VARRAY for fixed categories
  TYPE weight_category_varray IS VARRAY(3) OF VARCHAR2(20);
  weight_categories weight_category_varray := weight_category_varray('Light', 'Medium', 'Heavy');

  CURSOR c IS SELECT item_id, name, category, weight, status FROM ewaste_items ORDER BY item_id;

  idx NUMBER := 0;
  total_weight NUMBER := 0;

BEGIN
  FOR r IN c LOOP
    idx := idx + 1;

    -- skip invalid rows using GOTO
    IF r.status = 'INVALID' OR r.category IS NULL OR r.weight IS NULL THEN
      DBMS_OUTPUT.PUT_LINE('Skipping invalid item ID ' || r.item_id);
      GOTO skip_item;
    END IF;

    -- store in associative array
    items(idx).item_id := r.item_id;
    items(idx).name := r.name;
    items(idx).category := r.category;
    items(idx).weight := r.weight;

    -- store weight in nested table
    daily_weights.EXTEND;
    daily_weights(daily_weights.COUNT) := r.weight;

    total_weight := total_weight + r.weight;

    <<skip_item>>
    NULL;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('--- VALID ITEMS COLLECTED ---');
  FOR i IN 1..items.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(items(i).item_id || ' - ' ||
                         items(i).name || ' - ' ||
                         items(i).category || ' - ' ||
                         items(i).weight || 'g');
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Total Weight Collected: ' || total_weight || ' grams');

END;
/
