import re
import sys
import time

def find_all_overlapping_matches(pattern, string):
    matches = []
    pos = 0
    while pos < len(string):
        match = re.search(pattern, string[pos:])
        if match:
            start_pos = pos + match.start()
            matches.append(start_pos)
            # 次の検索を1文字進めることでオーバーラップを可能にする
            pos = start_pos + 1
        else:
            break
    return matches

def main():
    if len(sys.argv) != 2:
        print("使用方法: python script.py <入力文字列>")
        sys.exit(1)
    
    input_string = sys.argv[1]
    regex = r"(?=.*a.*)(?=.*b.*)"
    
    start_time = time.perf_counter()
    result = find_all_overlapping_matches(regex, input_string)
    end_time = time.perf_counter()
    
    elapsed_time = end_time - start_time
    
    # print("オーバーラップするマッチの開始位置:", result)
    # print(f"マッチングにかかった時間: {elapsed_time:.6f} 秒")
    print(elapsed_time)

if __name__ == "__main__":
    main()