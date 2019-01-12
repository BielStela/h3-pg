\pset tuples_only on

-- neighbouring indexes (one hexagon, one pentagon) at resolution 3
\set invalid '\'0\''
\set hexagon '\'831c02fffffffff\'::h3index'
\set pentagon '\'831c00fffffffff\'::h3index'
\set resolution 3

--
-- TEST h3_h3_get_resolution
--

SELECT h3_h3_get_resolution(:hexagon) = :resolution AND h3_h3_get_resolution(:pentagon) = :resolution;

--
-- TEST h3_h3_get_base_cell
--

-- base cell is same for parents
SELECT h3_h3_get_base_cell(:hexagon) = h3_h3_get_base_cell(h3_h3_to_parent(:hexagon));
SELECT h3_h3_get_base_cell(:pentagon) = h3_h3_get_base_cell(h3_h3_to_parent(:pentagon));

--
-- TEST h3_h3_is_valid
--

SELECT h3_h3_is_valid(:hexagon) AND h3_h3_is_valid(:pentagon) AND NOT h3_h3_is_valid(:invalid);

--
-- TEST h3_h3_is_res_class_iii
--

-- if index is Class III then parent is not
SELECT h3_h3_is_res_class_iii(:hexagon) AND NOT h3_h3_is_res_class_iii(h3_h3_to_parent(:hexagon));
SELECT h3_h3_is_res_class_iii(:pentagon) AND NOT h3_h3_is_res_class_iii(h3_h3_to_parent(:pentagon));

--
-- TEST h3_h3_is_pentagon
--

SELECT h3_h3_is_pentagon(:pentagon) AND NOT h3_h3_is_pentagon(:hexagon);


