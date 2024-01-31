import sys

import pandas as pd
from sqlalchemy import create_engine
from time import time
# print(sys.argv)

# day = sys.argv[1]

# # some fancy stuff with pandas

# print(f'job finished successfully for day = {day}')

print(sys.argv)

file = sys.argv[1]

print(f'job finished successfully for day = {file}')

engine = create_engine('postgresql://root:root@localhost:5432/ny_taxi')
engine.connect()
print(pd.__version__)
df_iter = pd.read_csv(file, iterator=True)
df = next(df_iter)
df.lpep_pickup_datetime = pd.to_datetime(df.lpep_pickup_datetime)
df.lpep_dropoff_datetime = pd.to_datetime(df.lpep_dropoff_datetime)
df.to_sql(name=file, con=engine,if_exists='replace')


# while True:
#     t_start = time()
    
#     df = next(df_iter)
    
#     df.lpep_pickup_datetime = pd.to_datetime(df.lpep_pickup_datetime)
#     df.lpep_dropoff_datetime = pd.to_datetime(df.lpep_dropoff_datetime)
    
#     df.to_sql(name=file, con=engine,if_exists='append')

#     t_end = time()
    
#     print('insert another chunk... %.3f' % (t_end - t_start))