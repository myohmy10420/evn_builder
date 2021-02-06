
WITH fake_data AS (
  SELECT 974 AS bp_id,
         'CC' AS pay_method,
         '2020-01-07'::date AS collected_on,
         8000 AS collect_amount,
         '2020-01-07'::date AS settle_date
   UNION SELECT 974, 'CC',         '2020-01-16', 1000,  '2020-01-17'
   UNION SELECT 974, 'CC',         '2020-04-27', 2000,  '2020-04-28'
   UNION SELECT 987, 'UPOP',       '2020-04-27', 3000,  '2020-04-28'
   UNION SELECT 974, 'UPOP',       '2020-07-06', 8200,  '2020-07-16'
   UNION SELECT 974, 'UPOP',       '2020-07-06', 8300,  '2020-07-16'
   UNION SELECT 974, 'UPOP',       '2020-07-06', 8500,  '2020-07-16'
   UNION SELECT 974, 'UPOP',       '2020-09-08', 10000, '2020-09-19'
   UNION SELECT 526, 'UPOP',       '2020-09-08', 500,   '2020-09-19'
   UNION SELECT 526, 'UPOP',       '2020-09-02', 2000,  '2020-09-19'
   UNION SELECT 526, 'UPOP',       '2020-09-07', 10000, '2020-09-19'
  ORDER BY bp_id DESC, collected_on
)

-- SELECT bp_id,
--        pay_method,
--        collect_amount,
--        collected_on
--   FROM fake_data
  SELECT bp_id,
         pay_method,
         STRING_AGG (collect_amount::TEXT, ' / ' ORDER BY bp_id DESC)
    FROM fake_data
GROUP BY bp_id, pay_method
