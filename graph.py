# import os
# import re

# # ディレクトリパスを指定
# dir_path = '/Users/tomiiekoichiro/output_dir'

# # ファイル名から<number1>を取得するための正規表現
# pattern = r'output(\d+)_(\d+).txt'

# # <number1>を格納するリスト
# number1_list = []

# # ファイルの中身から読み取った数値を格納するリスト
# numbers_list = []

# # ディレクトリ内のファイルを走査
# for file_name in os.listdir(dir_path):
#     # ファイル名がoutput<number1>_<number2>.txtの形式であるか確認
#     match = re.match(pattern, file_name)
#     if match:
#         # <number1>を取得
#         number1 = int(match.group(1))
#         number1_list.append(number1)

#         # ファイルの中身を読み取り
#         file_path = os.path.join(dir_path, file_name)
#         with open(file_path, 'r') as file:
#             # 5行目に書かれた数値を読み取り
#             lines = file.readlines()
#             if len(lines) >= 5:
#                 number = float(lines[4].strip())
#                 numbers_list.append(number)
#             else:
#                 print(f"{file_name}には5行目がありません")
#             # # 1行目に書かれた数値を読み取り
#             # number = int(file.readline().strip())
#             # numbers_list.append(number)

# # 10個ずつ取り出し、平均を取る
# average_list = []
# for i in range(0, len(numbers_list), 10):
#     chunk = numbers_list[i:i+10]
#     average = sum(chunk) / len(chunk)
#     average_list.append(average)

# # 余った個数分の平均を取る
# if len(numbers_list) % 10 != 0:
#     last_chunk = numbers_list[-(len(numbers_list) % 10):]
#     last_average = sum(last_chunk) / len(last_chunk)
#     average_list.append(last_average)

# print(number1_list)
# print(average_list)
# print(len(average_list))



# import os
# import re

# # ディレクトリパスを指定
# dir_path = '/Users/tomiiekoichiro/output_dir'

# # ファイル名から<number1>を取得するための正規表現
# pattern = r'output(\d+)_(\d+).txt'

# # <number1>とファイルの中身から読み取った数値のペアを格納するリスト
# pair_list = []

# # ディレクトリ内のファイルを走査
# for file_name in os.listdir(dir_path):
#     # ファイル名がoutput<number1>_<number2>.txtの形式であるか確認
#     match = re.match(pattern, file_name)
#     if match:
#         # <number1>を取得
#         number1 = int(match.group(1))

#         # ファイルの中身を読み取り
#         file_path = os.path.join(dir_path, file_name)
#         with open(file_path, 'r') as file:
#             # 5行目に書かれた数値を読み取り
#             lines = file.readlines()
#             if len(lines) >= 5:
#                 number = float(lines[4].strip())
#                 pair_list.append((number1, number))
#             else:
#                 print(f"{file_name}には5行目がありません")

# # ペアリストをペアの1番目の要素を基準に昇順にソート
# pair_list.sort(key=lambda x: x[0])

# # 10個ずつ取り出し、平均を取る
# average_list = []
# for i in range(0, len(pair_list), 10):
#     chunk = pair_list[i:i+10]
#     average = sum([pair[1] for pair in chunk]) / len(chunk)
#     average_list.append(average)

# # 余った個数分の平均を取る
# if len(pair_list) % 10 != 0:
#     last_chunk = pair_list[-(len(pair_list) % 10):]
#     last_average = sum([pair[1] for pair in last_chunk]) / len(last_chunk)
#     average_list.append(last_average)

# print(pair_list)
# print(len(pair_list))
# print(average_list)
# print(len(average_list))



import os
import re
import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import curve_fit

# ディレクトリパスを指定
dir_path = '/Users/tomiiekoichiro/output_dir'

# ファイル名から<number1>を取得するための正規表現
pattern = r'output(\d+)_(\d+).txt'

# <number1>とファイルの中身から読み取った数値のペアを格納するリスト
pair_list = []

# ディレクトリ内のファイルを走査
for file_name in os.listdir(dir_path):
    # ファイル名がoutput<number1>_<number2>.txtの形式であるか確認
    match = re.match(pattern, file_name)
    if match:
        # <number1>を取得
        number1 = int(match.group(1))

        # ファイルの中身を読み取り
        file_path = os.path.join(dir_path, file_name)
        with open(file_path, 'r') as file:
            # 5行目に書かれた数値を読み取り
            lines = file.readlines()
            if len(lines) >= 5:
                number = float(lines[4].strip())
                pair_list.append((number1, number))
            else:
                print(f"{file_name}には5行目がありません")

# ペアリストをペアの1番目の要素を基準に昇順にソート
pair_list.sort(key=lambda x: x[0])

# ペアの1番目の要素でグループ化し、平均を取る
average_dict = {}
for pair in pair_list:
    if pair[0] not in average_dict:
        average_dict[pair[0]] = []
    average_dict[pair[0]].append(pair[1])

for key, value in average_dict.items():
    average = sum(value) / len(value)
    print(f"{key}: {average}")

# # 散布図を作成
# plt.scatter(average_dict.keys(), [sum(value) / len(value) for value in average_dict.values()])
# plt.xlabel('number1')
# plt.ylabel('average')
# plt.title('Scatter Plot')
# plt.show()

# 散布図を作成
x = np.array(list(average_dict.keys()))
y = np.array([sum(value) / len(value) for value in average_dict.values()])

# # 直線近似
# z = np.polyfit(x, y, 1)
# p = np.poly1d(z)

# plt.scatter(x, y)
# plt.plot(x, p(x), "r--")
# plt.xlabel('number1')
# plt.ylabel('average')
# plt.title('Scatter Plot')

# # 直線の式を図の中に書き込む
# eq_str = f"y = {z[0]:.2f}x + {z[1]:.2f}"
# plt.text(x.mean(), y.mean(), eq_str, ha='center', va='center', fontsize=12)

# plt.show()



# # 2次近似
# z = np.polyfit(x, y, 1/2)
# p = np.poly1d(z)

# plt.scatter(x, y)
# plt.plot(x, p(x), "r--")
# plt.xlabel('number1')
# plt.ylabel('average')
# plt.title('Scatter Plot')

# # 2次近似の式を図の中に書き込む
# eq_str = f"y = {z[0]:.10f}x^2 + {z[1]:.2f}x + {z[2]:.2f}"
# plt.text(x.mean(), y.mean(), eq_str, ha='center', va='center', fontsize=12)

# plt.show()






# # 0.5次近似
# def func(x, a, b):
#     return a * np.power(x, 0.5) + b

# popt, pcov = curve_fit(func, x, y)

# plt.scatter(x, y)
# plt.plot(x, func(x, *popt), "r--")
# plt.xlabel('number1')
# plt.ylabel('average')
# plt.title('Scatter Plot')

# # 0.5次近似の式を図の中に書き込む
# eq_str = f"y = {popt[0]:.2f}x^0.5 + {popt[1]:.2f}"
# plt.text(x.mean(), y.mean(), eq_str, ha='center', va='center', fontsize=12)

# plt.show()





# # 散布図を作成
# x = np.array(list(average_dict.keys()))
# y = np.array([sum(value) / len(value) for value in average_dict.values()])

# # 原点を通るように1次近似
# a = np.sum(x * y) / np.sum(x ** 2)
# plt.scatter(x, y)
# plt.plot(x, a * x, "r--")

# # 近似式を表示
# eq_str = f"y = {a:.2f}x"
# plt.text(x.mean(), y.mean(), eq_str, ha='center', va='center', fontsize=12)

# plt.xlabel('number1')
# plt.ylabel('average')
# plt.title('Scatter Plot')

# plt.show()






# # 原点を通るように0.5次近似
# a = np.sum(x * y) / np.sum(x ** 1.5)
# plt.scatter(x, y)
# plt.plot(x, a * np.power(x, 0.5), "r--")

# # 近似式を表示
# eq_str = f"y = {a:.2f}x^0.5"
# plt.text(x.mean(), y.mean(), eq_str, ha='center', va='center', fontsize=12)

# plt.xlabel('number1')
# plt.ylabel('average')
# plt.title('Scatter Plot')

# plt.show()








# # 原点を通るように0.8次近似
# a = np.sum(x * y) / np.sum(x ** 1.8)
# plt.scatter(x, y)
# plt.plot(x, a * np.power(x, 0.8), "r--")

# # 近似式を表示
# eq_str = f"y = {a:.2f}x^0.8"
# plt.text(x.mean(), y.mean(), eq_str, ha='center', va='center', fontsize=12)

# plt.xlabel('number1')
# plt.ylabel('average')
# plt.title('Scatter Plot')

# plt.show()


# # 決定係数を計算してみるといいかも
# # 原点を通るように0.8次近似
# a = np.sum(x * y) / np.sum(x ** 1.8)
# y_pred = a * np.power(x, 0.8)

# # 決定係数（R-squared）を計算
# ss_res = np.sum((y - y_pred) ** 2)
# ss_tot = np.sum((y - np.mean(y)) ** 2)
# r_squared = 1 - (ss_res / ss_tot)

# print(f"決定係数（R-squared）：{r_squared:.2f}")


# # 原点を通るように0.7次近似
# a = np.sum(x * y) / np.sum(x ** 1.7)
# y_pred = a * np.power(x, 0.7)

# # 決定係数（R-squared）を計算
# ss_res = np.sum((y - y_pred) ** 2)
# ss_tot = np.sum((y - np.mean(y)) ** 2)
# r_squared = 1 - (ss_res / ss_tot)

# print(f"決定係数（R-squared）：{r_squared:.2f}")









# 原点を通るように1.3次近似
a = np.sum(x * y) / np.sum(x ** 2.3)
plt.scatter(x, y)
plt.plot(x, a * np.power(x, 1.3), "r--")

# 近似式を表示
eq_str = f"y = {a:.2f}x^1.3"
plt.text(x.mean(), y.mean(), eq_str, ha='center', va='center', fontsize=12)

plt.xlabel('string length')
plt.ylabel('average time')
plt.title('Scatter Plot')

plt.show()

# 原点を通るように1.3次近似
a = np.sum(x * y) / np.sum(x ** 2.3)
y_pred = a * np.power(x, 1.3)

# 決定係数（R-squared）を計算
ss_res = np.sum((y - y_pred) ** 2)
ss_tot = np.sum((y - np.mean(y)) ** 2)
r_squared = 1 - (ss_res / ss_tot)

print(f"決定係数（R-squared）：{r_squared:.2f}")