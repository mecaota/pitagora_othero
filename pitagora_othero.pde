void draw() {
  noCursor();
  deadline(liney);
  fill(255, 255, 255); //ボール・ラケットの白塗りつぶし
  ellipse(x, y, a_r, a_r);   // ボール
  if (command==1) {
    rect(r_p, d * 65 - 10, r_w, 3); // ラケット
  }
  fill(255); //ブロック消えた後の表示色
  rect(0, 40, width, 40); //ブロック消えた後の表示ブロック
  smooth();


  switch(command) {

  case 1: // キー入力あったとき＝ゲーム開始
    fill(0, 0, 0, 20);
    rect(0, 0, width, height);
    int ref = 0;

    // ボールの動き
    x = x + dx + a_d; 
    y = y + dy;

    // 反射判定
    if (x + a_r >= width) { //画面左端
      a_d = 0;
      dx = -1;
      effect(x + a_r, y);
    } else if (x < 0) {   //画面右端
      a_d = 0;
      dx = 1;
      effect(x - a_r, y);
    }

    if (y > d * 65-20) {     //デッドライン超えたとき
      ball_count--;
      if (ball_count == 0) { //ゲームオーバーか否か
        framenum=0;
        command = 10; //ゲームオーバー
      } else {
        x = 0;
        y = 100;
        dx = 1;
        dy = 2;
        count = 0;
      }
    } else if (y < 0) {
      dy = 2;
      effect(x + a_r, y + a_r);
    }

    //ゲームクリア判定
    int sum = 0; //hitの値とか足した値
    for (int i = 0; i < hit.length; i++) {
      sum = sum + hit[i];
    }
    if (sum == 0) {
      framenum=0;
      command = 20; //クリア
    }

    // ラケット動作制御
    r_p = r_d + r_p;
    if (r_p + 20 > width - r_w / 2) { // ラケット方向切り替え右側判定
      r_d = - r_s;
    } else if (r_p < 0) {            // ラケット方向切り替え左側判定
      r_d = r_s;
    }

    for (int i = 0; i<hit.length; i++) {
      switch(hit[i]) {
      case 0:
        fill(255, 255, 255);
        break;
      case 1:
        fill(200, 200, 200);
        break;
      case 2:
        fill(150, 150, 150);
        break;
      case 3:
        fill(100, 100, 100);
        break;
      case 4:
        fill(50, 50, 50);
        break;
      case 5:
        fill(0, 0, 0);
        break;
      default:
        fill(255, 255, 255);
        break;
      }
      if (hit[i] > 0) {
        show_block(i); //ブロック描写
        ref = checkHitBlock(i, x, y); //ブロック衝突回数
        switch (ref) {
        case 1:
          hit[i]--;
          effect(x + a_r, y + a_r);
        case 2:
        case 8:
          dy = sy;
          break;
        case 5:
          hit[i]--;
          effect(x + a_r, y + a_r);
        case 4:
        case 6:
          dy = -sy;
          break;
        }
        switch (ref) {
        case 2:
        case 3:
        case 4:
          dx = sx;
          effect(x + a_r, y + a_r);
          break;
        case 6:
        case 7:
        case 8:
          dx = -sx;
          effect(x + a_r, y + a_r);
          break;
        }
      }
    }
    if (s_c % 2 == 0) {
      noLoop();
    } else {
      loop();
    }
    fill(255); //ライフゲージ色
    rect(0, 0, (width / 3) * ball_count, 10); //ライフゲージ

    if (checkHit(x, y)) { 
      dy = -2;
      count = count + 1 ; //衝突回数
    }
    break;

  case 2:
    framenum++;
    if (framenum == timecount) {
      command=1;
    }
    break;





    //10系統ゲームオーバー系
  case 10: 
    fill(0, 0, 0, 20);
    rect(0, 0, width, height);
    for (int i = 0; i<hit.length; i++) {
      switch(hit[i]) {
      case 0:
        fill(255, 255, 255);
        break;
      case 1:
        fill(200, 200, 200);
        break;
      case 2:
        fill(150, 150, 150);
        break;
      case 3:
        fill(100, 100, 100);
        break;
      case 4:
        fill(50, 50, 50);
        break;
      case 5:
        fill(0, 0, 0);
        break;
      default:
        fill(255, 255, 255);
        break;
      }
      show_block(i);
    }
    framenum++;
    liney--;
    y=liney;
    dx = 0; //ボール停止
    dy = 0;
    if (liney==-50) {
      framenum=0;
      command=11;
      oval1 = 17;
      sendServo(1, oval1);
    }
    break;

  case 11:
    for (int i = 0; i<hit.length; i++) {
      switch(hit[i]) {
      case 0:
        fill(255, 255, 255);
        break;
      case 1:
        fill(200, 200, 200);
        break;
      case 2:
        fill(150, 150, 150);
        break;
      case 3:
        fill(100, 100, 100);
        break;
      case 4:
        fill(50, 50, 50);
        break;
      case 5:
        fill(0, 0, 0);
        break;
      default:
        fill(255, 255, 255);
        break;
      }
      show_block(i);
    }
    framenum++;
    if (framenum>=400) {
      if (framenum==400) {
        liney=0;
      }
      liney+=0.163*(framenum-60);
      deadline(liney);
      fill(0);
      rect(0, 0, width, liney);
      if (liney>height) {
        effect(width / 2 + 20, height / 2); //なんかかっこいい何か
        textAlign(CENTER);
        fill(0, 0, 210); //テキスト青塗りつぶし
        textSize(50); //テキストサイズ50
        text("You Lose", width/2, height/2);
        oval1 = 80;
        sendServo(1, oval1);
      }
    }
    break;










    //20系統ゲームクリアー系
  case 20: 
    fill(0, 0, 0, 20);
    rect(0, 0, width, height);
    for (int i = 0; i<hit.length; i++) {
      switch(hit[i]) {
      case 0:
        fill(255, 255, 255);
        break;
      case 1:
        fill(200, 200, 200);
        break;
      case 2:
        fill(150, 150, 150);
        break;
      case 3:
        fill(100, 100, 100);
        break;
      case 4:
        fill(50, 50, 50);
        break;
      case 5:
        fill(0, 0, 0);
        break;
      default:
        fill(255, 255, 255);
        break;
      }
      show_block(i);
    }
    framenum++;
    liney--;
    if (liney<=y) {
      y=liney;
    } else {
      y+=framenum*0.16;
    }
    dx = 0; //ボール停止
    dy = 0;
    if (liney==-50) {
      framenum=0;
      command=21;
      oval1 = 17;
      sendServo(1, oval1);
    }
    break;

  case 21:
    for (int i = 0; i<hit.length; i++) {
      switch(hit[i]) {
      case 0:
        fill(255, 255, 255);
        break;
      case 1:
        fill(200, 200, 200);
        break;
      case 2:
        fill(150, 150, 150);
        break;
      case 3:
        fill(100, 100, 100);
        break;
      case 4:
        fill(50, 50, 50);
        break;
      case 5:
        fill(0, 0, 0);
        break;
      default:
        fill(255, 255, 255);
        break;
      }
      show_block(i);
    }
    framenum++;
    if (framenum>=400) {
      if (framenum==400) {
        liney=0;
      }
      liney+=0.163*(framenum-60);
      deadline(liney);
      fill(255);
      rect(0, 0, width, liney);
      if (liney>height) {
        effect(width / 2 + 20, height / 2); //なんかかっこいい何か
        textAlign(CENTER);
        fill(250, 0, 0); //テキスト赤塗りつぶし
        textSize(50); //テキストサイズ50
        text("You Win!", width/2+50, height/2);
        oval1 = 80;
        sendServo(1, oval1);
      }
    }
    break;


  default:
    break;
  }
}
