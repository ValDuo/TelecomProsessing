COPY (
      SELECT 
          Id,
          UID,
          Type,
          IdPlan,
          TurnOn,
          Hacked,
          Traffic
      FROM (
          SELECT 
              filecsv.IdSubscriber AS Id,
              CASE 
                  WHEN filecsv.DownTx = 0 THEN NULL  
                  ELSE CAST(filecsv.UpTx AS FLOAT) / filecsv.DownTx 
              END AS koef,
              subs.IdClient AS UID,
              'P' AS Type,
              clients.IdPlan,
              TRUE AS TurnOn,
              TRUE AS Hacked,
              filecsv.UpTx - filecsv.DownTx AS Traffic
          FROM 
              read_csv('psx_*.csv', hive_partitioning=1) AS filecsv
          JOIN 
              read_csv('subscribers.csv') AS subs
          ON 
              filecsv.IdSubscriber = subs.IdOnPSX
          JOIN 
              read_parquet('client.parquet') AS clients
          ON 
              subs.IdClient = clients.id
          WHERE 
              filecsv.EndSession IS NOT NULL
      ) AS subquery
      WHERE 
          koef > 1.5 AND Traffic > 0
  ) TO 'result.csv' (HEADER, DELIMITER ',');
