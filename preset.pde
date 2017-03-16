//初期値
float r_p = -50; // ラケット位置
float r_d;    // ラケット変位
float r_s = 1.4;//ラケット速度

float x = -40; //ボール位置ｘ
float y = 100; //ボール位置ｙ
float dx = 2; //ボール変位ｘ
float dy = 4; //ボール変位ｙ
float sx = 2; //反射後ボール変位x
float sy = 4; //反射後ボール変位y

//初期値 カウント
float count = 0;     //衝突回数
float score; //スコア
float parameter = 0; //ボーナススコア
int ball_count = 3; //ボールライフ
int command; //画面遷移の画面番号
int s_c = 1; //ポーズ判定
int d; // 難易度値
int framenum=0; //フレーム数
int timecount =1; //待機フレーム数

float liney=0; //赤バーの位置


int hit[] = {
  5
}; // ブロックダメージ値

float r_w = 100.0; // ラケット幅
float b_w = 2000; // ブロック幅
float b_h = 40.0; // ブロック高さ
float a_r = 50.0; // ボール直径 旧a_w
// ボール高さ 旧a_h
float a_d = 0;        // ボールの動作の変位   

float a_d_score = abs(a_d); // スピードボーナス

void setup() {//初期設定
  // size(600, 600);// ウィンドウサイズ設定
  size(displayWidth, displayHeight); 
  background(0);  //初期背景黒
  r_d = 1.2; //ラケット初期速度
  d=10;  //難易度
  liney=d*65;
  println(Serial.list()); // 使用可能なシリアルポート一覧の出力。デバッグ用
  String portName = Serial.list()[1]; // 使用するシリアルポート名
  serialPort = new Serial(this, portName, 9600);
  serialPort.buffer(inByte.length); // 読み込むバッファの長さをの指定

  oval1 = 70;
  sendServo(1, oval1);
}
