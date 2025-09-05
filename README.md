# TelecomProsessing
A solution for Big Data Hack 2025 task.

The task description:
You are required to analyze the dataset stored in the /DATA folder on the cluster system or in the /DATA directory on HDFS. Alternatively, you can download it locally using this link: https://disk.yandex.ru/d/OIYpYJ1NUWXtYQ.

The telecom100k dataset is provided for training purposes and includes a file with correct answers. However, your final analysis must be performed on the larger telecom1000k dataset, which contains one million records.

Your task is to generate a final list of hacked accounts using all available methods of big data processing. This list must be saved as a file with the following header:

Id,UID,Type,IdPlan,TurnOn,Hacked,Traffic
4490,1deb20d7-1f4d-4ea9-adcb-72e6a56df1d5,P,2,True,True,122472
...

Your final answer must be published in a file named result.csv. The user identifier column must be named 'UID'.

The result.csv file must contain only records related to hacked users; all other records must be omitted. No fields within the file can be empty.

Results: 
I gathered the 95.617529880478% of all hacked accounts using my SQL code.
<img width="261" height="194" alt="image" src="https://github.com/user-attachments/assets/9df860ee-f040-48cd-9dda-16abd72deb17" />

