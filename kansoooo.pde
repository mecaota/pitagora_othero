//同心円エフェクト関数
void effect(float ex, float ey) {   //effect x座標、effect y座標
  float diameter, i;

  //初期条件の設定
  //  noStroke();
  fill(random(100, 255), random(100, 255), random(100, 255), 10); //色はランダム
  diameter = 300; //円の直径を代入

  //同心円を描く
  for (i=0; i<32; i++) { //i<○の○部分を変更で円の密度変更
    ellipse(ex, ey, diameter, diameter); //同心円描写
    diameter = diameter - 20;
  }
}

//ブロック描写関数
void show_block(int n) {
  rect(b_w * n, 40, b_w, b_h);
}

void deadline(float ly) {
  strokeWeight(1);
  switch(command) {
    //クリア後
  case 10:
    fill(0);
    stroke(255);
    break;
  case 11:
    fill(0);
    noStroke();
  case 12:
  case 13:
  case 14:
  case 15:
  case 16:
  case 17:
  case 18:
  case 19:
    break;

    //ゲームオーバー後
  case 20:
    fill(255);
    stroke(0);
    break;
  case 21:
    fill(255);
    noStroke();
  case 22:
  case 23:
  case 24:
  case 25:
  case 26:
  case 27:
  case 28:
  case 29:
    break;

  default:
    fill(200, 50, 50);
    stroke(200, 50, 50);
    break;
  }
  rect(0, ly, width, 5);  // デッドライン
  noStroke();
}
