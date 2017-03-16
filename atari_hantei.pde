//パッドへのあたり判定関数
boolean checkHit(float x, float y) { 
  //ボールがデッドラインより内側か否か
  if (y + a_r <= d * 65) return false; //false=セーフ
  //ボールがパッドから外したか否か
  if (x + a_r >= r_p && x <= r_p + r_w && y + r_w > d * 50) {
    return true; //true＝アウトー
  } else {
    return false; //false=セーフ
  }
}

//ブロックへの当たり判定関数
int checkHitBlock(int n, float x, float y) {
  float left   = b_w * n;    //左判定
  float right  = b_w * (n + 1); //右判定
  float top    = 40 + 8;     //上端判定
  float bottom = 40 + b_h;   //下端判定
  float cx = left + b_w / 2;
  float cy = top + b_h / 2;
  float y1, y2;

  if ((x + a_r <= left) ||
    (x >= right) ||
    (y + a_r <= top) ||
    (y >= bottom)) {
    return 0;
  }

  x = x + a_r / 2; //ボール中心を移動の中心に設定
  y = y + a_r / 2; //ボール中心を移動の中心に設定

  y1 = y - (-(x - cx)* b_h / b_w + cy);
  y2 = y - ( (x - cx)* b_h / b_w + cy);

  if (y1 > 0) {
    if (y2 > 0) {
      return 1;
    } else if (y2 == 0) {
      return 2;
    } else {
      return 3;
    }
  } else if (y1 < 0) {
    if (y2 > 0) {
      return 7;
    } else if (y2 == 0) {
      return 6;
    } else {
      return 5;
    }
  } else {
    if (y2 > 0) {
      return 8;
    } else if (y2 == 0) {
      return -1;
    } else {
      return 4;
    }
  }
}
