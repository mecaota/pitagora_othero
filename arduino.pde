//ライブラリ
import processing.serial.*;

//ｱﾙﾃﾞｭｲｲｲﾝﾉ
Serial serialPort; // Arduinoにデータを送るシリアルポート
boolean firstContact = false;  //Arduinoからのはじめの送信を確認する

byte[] inByte = new byte[3]; // 受信データ用バッファ

int oval1;

// シリアルポートにデータが受信されると呼び出されるメソッド
void serialEvent(Serial port) {
  inByte = port.readBytes();

  if(firstContact == false) {
    if(inByte[0] == 'C') { // Arduinoとの接続確認
      port.clear();
      firstContact = true;
      sendServo(1, 70);
    } 
  }
}

// シリアルポートにサーボの値を送るメソッド
void sendServo(int id, int value)
{
  if(!firstContact) return;
  int v = value;
  if(v < 15) v = 15; // サーボの最小値。個体差による。
  if(v > 125) v = 125; // サーボの最大値。個体差による。
  serialPort.write((byte)'S');
  serialPort.write((byte)id);
  serialPort.write((byte)v);
}
