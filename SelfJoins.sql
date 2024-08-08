-- One of the most common use cases for self JOINs is in cases where two events occurred,
-- one after another. As you may have noticed in the previous video, using inequalities in
-- conjunction with self JOINs is common.

-- change the interval to 1 day to find those web events that occurred after,
-- but not more than 1 day after, another web event

SELECT we1.id AS we_id,
       we1.account_id AS we1_account_id,
       we1.occurred_at AS we1_occurred_at,
       we1.channel AS we1_channel,
       we2.id AS we2_id,
       we2.account_id AS we2_account_id,
       we2.occurred_at AS we2_occurred_at,
       we2.channel AS we2_channel
  FROM web_events we1 
 LEFT JOIN web_events we2
   ON we1.account_id = we2.account_id
  AND we1.occurred_at > we2.occurred_at
  AND we1.occurred_at <= we2.occurred_at + INTERVAL '1 day'
ORDER BY we1.account_id, we2.occurred_at