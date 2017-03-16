// キー入力関数
void keyPressed() {
  if (keyCode == RIGHT) { //→キー受付
    a_d = a_d + r_s * 0.3; //右方向加速値代入
  } else if (keyCode == LEFT) { //左キー受付
    a_d = a_d - r_s * 0.3; //左方向加速値代入
  } else if (keyCode == ENTER) { //Enterキー受付
    command = 2; //ゲーム開始
    text("Waiting for ball insert", 10, height-10);
  } else if (keyCode == SHIFT) { //シフトキー受付
    s_c++; //ポーズ判定値１＋
  } else if (key =='c') { //['o']ｶﾁｶﾁｶﾁｶﾁ
    command = 3; //クリアー画面表示
  } else if (key =='d') { //['o']ｶﾁｶﾁｶﾁｶﾁ
    ; //ブロック1個だけ
    for (int i = 0; i < hit.length - 1; i++) {
      hit[i] = 0;
    }
    hit[hit.length - 1] = 1;
  } else if (keyCode == ALT) { //ALTキー入力
    command=1;
  }
}


void mousePressed() {
  if (mouseButton == RIGHT) { //右クリック受付
    a_d = a_d + r_s * 0.3; //右方向加速値代入
  } else if (mouseButton == LEFT) { //左クリック受付
    a_d = a_d - r_s * 0.3; //左方向加速値代入
  }
}
