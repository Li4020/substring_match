# import os
# import numpy as np
# import matplotlib.pyplot as plt

# # ディレクトリパス
# base_path = "/Users/tomiiekoichiro/ppl_data"
# directories = ["popl", "popl_poly", "popl_line"]

# # 色とラベルを設定
# colors = {"popl": "red", "popl_poly": "blue", "popl_line": "green"}
# labels = {"popl": "(a*)*(?=.*b.*)", "popl_poly": "a*(?=.*b.*)", "popl_line": "(?=.*a.*)(?=.*b.*)"}

# # プロット用データ
# data = {}

# for directory in directories:
#     path = os.path.join(base_path, directory)
#     x_values = []
#     y_values = []
#     if os.path.exists(path) and os.path.isdir(path):
#         for file in os.listdir(path):
#             if file.startswith("output_") and file.endswith(".txt"):
#                 # ファイル名からnumber1を抽出
#                 number1 = int(file[len("output_"):-len(".txt")])  
#                 file_path = os.path.join(path, file)
#                 with open(file_path, "r") as f:
#                     # ファイル内容からnumber2を取得
#                     number2 = float(f.read().strip())
#                 x_values.append(number1)
#                 y_values.append(number2)
#     data[directory] = (x_values, y_values)

# # プロットの準備
# plt.figure(figsize=(10, 6))

# for directory, (x_values, y_values) in data.items():
#     x = np.array(x_values)
#     y = np.array(y_values)
#     plt.scatter(x, y, color=colors[directory], label=labels[directory], alpha=0.7)
#     # plt.plot(x, y, color=colors[directory])

#     # 近似曲線（1次関数）を計算
#     if len(x) > 1:  # データが複数点ある場合のみ近似曲線を描画
#         coefficients = np.polyfit(x, y, 1)  # 1次近似
#         poly = np.poly1d(coefficients)
#         plt.plot(x, poly(x), color=colors[directory], linestyle="-")

# # グラフの設定
# # plt.title("Scatter Plot with Regression Lines")
# plt.xlabel("Size of string (number of characters)")
# plt.ylabel("Time (seconds)")
# plt.legend()
# plt.grid(True)
# plt.tight_layout()

# # グラフの表示
# plt.show()



import os
import numpy as np
import matplotlib.pyplot as plt

# ディレクトリパス
base_path = "/Users/tomiiekoichiro/ppl_data"
directories = ["popl", "popl_poly", "popl_line"]


# ディレクトリごとの近似手法
fit_methods = {
    "popl": "polynomial",  # 指数近似
    "popl_poly": "polynomial",   # 2次近似
    "popl_line": "polynomial"  # 1次近似
}

# 近似の次数（多項式近似の場合のみ使用）
approx_degrees = {
    "popl": 2,  # 指数近似は次数不要
    "popl_poly": 2,     # 2次近似
    "popl_line": 2    # 1次近似
}

# 色とラベルを設定
colors = {"popl": "red", "popl_poly": "blue", "popl_line": "green"}
labels = {"popl": "(a*)*(?>.*b.*)", "popl_poly": "a*(?>.*b.*)", "popl_line": "(?>.*a.*)(?>.*b.*)"}

# プロット用データ
data = {}

for directory in directories:
    path = os.path.join(base_path, directory)
    x_values = []
    y_values = []
    if os.path.exists(path) and os.path.isdir(path):
        for file in os.listdir(path):
            if file.startswith("output_") and file.endswith(".txt"):
                # ファイル名からnumber1を抽出
                number1 = int(file[len("output_"):-len(".txt")])
                file_path = os.path.join(path, file)
                with open(file_path, "r") as f:
                    # ファイル内容からnumber2を取得
                    number2 = float(f.read().strip())
                x_values.append(number1)
                y_values.append(number2)
    data[directory] = (x_values, y_values)

# グラフのアスペクト比を設定
fig_width = 5  # 横幅
fig_height = 7  # 高さ
plt.figure(figsize=(fig_width, fig_height))

for directory, (x_values, y_values) in data.items():
    x = np.array(x_values)
    y = np.array(y_values)
    plt.scatter(x, y, color=colors[directory], label=labels[directory], alpha=0.7)

    fit_type = fit_methods[directory]
    degree = approx_degrees[directory]

    if len(x) > 1:
        if fit_type == "polynomial":
            # 多項式近似（必ず0を通る）
            if len(x) > degree:
                # xとyを変換して切片をゼロにする
                X = np.vander(x, degree + 1)[:, :-1]  # 切片列を除去
                coefficients, _, _, _ = np.linalg.lstsq(X, y, rcond=None)
                # 近似曲線を計算
                x_sorted = np.sort(x)
                X_sorted = np.vander(x_sorted, degree + 1)[:, :-1]
                y_fit = X_sorted @ coefficients
                plt.plot(x_sorted, y_fit, color=colors[directory], linestyle="-",
                         label=f"{labels[directory]}\n  (poly fit, degree={degree})")

        elif fit_type == "exponential":
            # 指数近似
            # y = a * e^(b * x) → ln(y) = ln(a) + b * x
            y_positive = y[y > 0]  # 正の値のみ扱う（ログ変換のため）
            x_positive = x[y > 0]
            if len(x_positive) > 1:  # データ点が十分にある場合のみ近似を計算
                log_y = np.log(y_positive)
                coefficients = np.polyfit(x_positive, log_y, 1)  # 線形回帰
                a = np.exp(coefficients[1])  # ln(a)を戻す
                b = coefficients[0]
                # 近似曲線を描画
                x_sorted = np.sort(x_positive)
                y_fit = a * np.exp(b * x_sorted)
                plt.plot(x_sorted, y_fit, color=colors[directory], linestyle="-",
                         label=f"{labels[directory]} (exp fit)")

# グラフの設定
# plt.title("Scatter Plot with Regression Lines")
plt.xlabel("Size of string (number of characters)", fontsize=14)
plt.ylabel("Time (seconds)", fontsize=14)
plt.legend(fontsize=12)
plt.grid(True)
plt.tight_layout()

# グラフの表示
plt.show()