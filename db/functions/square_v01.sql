CREATE FUNCTION square(num int)
 RETURNS int AS $$
BEGIN
  return num * num;
END;
$$
LANGUAGE PLPGSQL;
