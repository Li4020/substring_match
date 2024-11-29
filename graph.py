import os
import re
import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import curve_fit

# ディレクトリパスを指定
dir_path = '/Users/tomiiekoichiro/output_dir2'

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
# x = np.array(list(average_dict.keys()))
# y = np.array([sum(value) / len(value) for value in average_dict.values()])

# # 原点を通るように線形近似
# z = np.polyfit(x, y, 1)
# p = np.poly1d([z[0], 0])  # 定数項を0に設定

# # 予測値を計算
# y_pred = p(x)

# # 残差を計算
# residuals = np.abs(y - y_pred)

# # 残差が大きいデータ点を除外
# threshold = 1.5  # 1.5σを閾値とする
# mask = residuals < np.std(residuals) * threshold
# x_filtered = x[mask]
# y_filtered = y[mask]

# # 散布図を作成
# plt.scatter(x_filtered, y_filtered)
# plt.plot(x_filtered, p(x_filtered), "r--")


# plt.show()









# # 散布図を作成
# x = np.array(list(average_dict.keys()))
# y = np.array([sum(value) / len(value) for value in average_dict.values()])

# # 0.8乗近似関数
# def func(x, a):
#     return a * x ** 0.8

# # 0.8乗近似
# popt, pcov = curve_fit(func, x, y)

# # 予測値を計算
# y_pred = func(x, *popt)

# # 残差を計算
# residuals = np.abs(y - y_pred)

# # 残差が大きいデータ点を除外
# threshold = 1.5  # 1.5σを閾値とする
# mask = residuals < np.std(residuals) * threshold
# x_filtered = x[mask]
# y_filtered = y[mask]

# # 散布図を作成
# plt.scatter(x_filtered, y_filtered)
# plt.plot(x_filtered, func(x_filtered, *popt), "r--")

# # 予測値を計算（外れ値を除外したデータについて）
# y_pred_filtered = func(x_filtered, *popt)

# # 平均値（外れ値を除外したデータについて）
# y_mean_filtered = np.mean(y_filtered)

# # 決定係数を計算（外れ値を除外したデータについて）
# ss_res = np.sum((y_filtered - y_pred_filtered) ** 2)
# ss_tot = np.sum((y_filtered - y_mean_filtered) ** 2)
# r_squared_filtered = 1 - (ss_res / ss_tot)

# print("外れ値を除外したデータについての決定係数:", r_squared_filtered)
# print(len(x_filtered))

# plt.show()
















# # 散布図を作成
# x = np.array(list(average_dict.keys()))
# y = np.array([sum(value) / len(value) for value in average_dict.values()])

# # 関数y = x^a
# def func(x, a):
#     return x ** a

# p0_list = [0.0, 0.5, 1.0, 1.5, 2.0]
# r_squared_list = []
# a_list = []
# for p0 in p0_list:
#     popt, pcov = curve_fit(func, x, y, p0=[p0])
#     y_pred = func(x, *popt)
#     y_mean = np.mean(y)
#     ss_res = np.sum((y - y_pred) ** 2)
#     ss_tot = np.sum((y - y_mean) ** 2)
#     r_squared = 1 - (ss_res / ss_tot)
#     r_squared_list.append(r_squared)
#     a_list.append(popt[0])

# # print("初期値:", p0_list)
# # print("最適化後のa:", a_list)
# # print("決定係数:", r_squared_list)

# max_index = np.argmax(r_squared_list)
# max_a = a_list[max_index]
# max_r_squared = r_squared_list[max_index]

# y_pred_max = func(x, max_a)

# plt.scatter(x, y)
# plt.plot(x, y_pred_max, "r--", label="y = x^%.2f" % max_a)
# plt.xlabel("x")
# plt.ylabel("y")
# plt.title("Scatter Plot and Approximation Curve")
# plt.legend()
# print(len(x))
# plt.show()

# print("決定係数: %.2f" % max_r_squared)



average_dict = {k: v for k, v in average_dict.items() if k < 5000}

# 散布図を作成
x = np.array(list(average_dict.keys()))
y = np.array([sum(value) / len(value) for value in average_dict.values()])

x = x[x < 5000]
y = y[x < 5000]









# # 関数y = k(x^a)
# def func(x, k, a):
#     return k * x ** a

# # kとaを最適化
# popt, pcov = curve_fit(func, x, y)

# # 予測値を計算
# y_pred = func(x, *popt)

# # 残差を計算
# residuals = np.abs(y - y_pred)

# # 残差が大きいデータ点を除外
# threshold = 1.5  # 1.5σを閾値とする
# mask = residuals < np.std(residuals) * threshold
# x_filtered = x[mask]
# y_filtered = y[mask]

# # 再度kとaを最適化
# popt, pcov = curve_fit(func, x_filtered, y_filtered)

# # 再度予測値を計算
# y_pred_filtered = func(x_filtered, *popt)

# # 再度決定係数を計算
# y_mean_filtered = np.mean(y_filtered)
# ss_res = np.sum((y_filtered - y_pred_filtered) ** 2)
# ss_tot = np.sum((y_filtered - y_mean_filtered) ** 2)
# r_squared = 1 - (ss_res / ss_tot)

# # 再度グラフを作り直す
# plt.scatter(x_filtered, y_filtered)
# plt.plot(x_filtered, y_pred_filtered, "r--", label="y = %.2f(x^%.2f)" % tuple(popt))
# plt.xlabel("x")
# plt.ylabel("y")
# plt.title("Scatter Plot and Approximation Curve")
# plt.legend()
# plt.show()

# print("決定係数:", r_squared)











# # 関数y = k(x^a)
# def func(x, k, a):
#     return k * x ** a

# # 2次導関数
# def func_2nd(x, k, a):
#     return k * a * (a - 1) * x ** (a - 2)

# # kとaを最適化
# popt, pcov = curve_fit(func, x, y)

# # 2次導関数を計算
# x_mid = np.mean(x)
# f_2nd = func_2nd(x_mid, *popt)

# # 劣線形であるかどうかを判定
# if f_2nd < 0:
#     print("劣線形です。")
# else:
#     print("劣線形ではありません。")



# # 散布図を作成
# x = np.array(list(average_dict.keys()))
# y = np.array([sum(value) / len(value) for value in average_dict.values()])

# power = 1.0

# # 原点を通るように1.3次近似
# a = np.sum(x * y) / np.sum(x ** (power + 1))
# y_pred = a * np.power(x, power)

# # 散布図を作成
# plt.scatter(x, y)
# plt.plot(x, y_pred, "r--")

# # 近似式を表示
# eq_str = f"y = {a:.2f}x^{power}"
# plt.text(x.mean(), y.mean(), eq_str, ha='center', va='center', fontsize=12)

# plt.xlabel('string length')
# plt.ylabel('average time')
# plt.title('Scatter Plot')

# # 決定係数（R-squared）を計算
# ss_res = np.sum((y - y_pred) ** 2)
# ss_tot = np.sum((y - np.mean(y)) ** 2)
# r_squared = 1 - (ss_res / ss_tot)

# print(f"決定係数（R-squared）：{r_squared:.2f}")


# plt.show()




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