color birdieWingB = color(46,57,231);
color birdieWingG = color(249,166,2);
color ground = 0;
int birdX = 0;
void setup() {
  size(500,500);
  
}

void draw() {
  background(color(255,255,255));
  //Creating background
  noStroke();
  fill(0);
  rect(0,0,792,310);
  fill(ground);
  rect(0,310,792,305);
  
  //Birdie Start
  fill(birdieWingB);
  noStroke();
  circle(442+birdX,157,35);
  //Eye
  fill(0);
  circle(452,157,6);
  triangle(449,156,453,154,449,152);
  triangle(451,159,455,157,454,162);
  fill(255,255,255);
  circle(451,155,2);
  //Beak
  fill(birdieWingB);
  triangle(457,164,454,167,464,174);
  triangle(455,167,451,170,460,177);
  //Chin thing
  fill(birdieWingG);
  circle(446,167,13.25);
  //Wing 1- Gold
  triangle(420,105,413,134,409,94);
  triangle(420,105,413,134,424,111);
  triangle(434,121,413,134,424,111);
  triangle(434,121,413,134,438,132);
  triangle(440,140,413,134,438,132);
  triangle(413,134,398,170,382,176);
  triangle(442,144,440,156,413,134);
  triangle(440,139,442,144,413,134);
  triangle(413,134,440,156,397,171);
  triangle(440,165,440,170,397,170);
  triangle(440,170,439,173,397,170);
  triangle(440,155,436,159,397,170);
  triangle(436,159,438,162,397,170);
  triangle(440,165,438,162,397,170);
  triangle(397,170,419,199,442,173);
  triangle(419,199,397,170,368,215);
  triangle(368,215,375,224,419,199);
  triangle(368,215,375,224,360,220);
  triangle(346,234,375,224,360,220);
  
  //Birdie's Feet
  fill(211,186,137);
  triangle(418,199,397,211,417,204);
  triangle(417,204,409,210,397,211);
  triangle(397,211,409,210,404,213);
  triangle(404,213,410,212,409,210);
  fill(71,58,36); 
  quad(409,210,417,204,420,205,410,212);
  quad(410,212,417,211,424,205,420,205);
  quad(417,211,424,211,429,208,424,205);
  quad(424,211,431,211,434,208,429,208);
  quad(431,211,434,208,440,208,440,211);
  quad(440,208,443,208,443,211,440,211);
  quad(430,211,440,211,437,213,432,213);
  triangle(440,211,437,213,441,214);
  quad(413,216,418,216,424,211,417,211);
  quad(417,216,413,216,412,218,414,217);
  triangle(412,218,414,218,414,220); 
  
  //Tail
  fill(birdieWingB);
  quad(352,217,360,220,352,228,345,222);
  quad(345,222,349,223,304,254,301,252);
  triangle(295,257,304,254,301,252);
  quad(348,225,352,228,312,270,310,267);
  triangle(352,217,360,220,369,215);
  quad(369,215,352,217,387,178,395,175);
  
  //Back
  quad(395,175,398,170,382,176,373,183);
  quad(392,81,391,164,413,134,409,94);
  quad(391,157,391,165,382,176,378,179);
  triangle(370,71,392,95,392,81);
  
  //First Wing
  quad(381,100,372,84,378,79,392,96);
  quad(374,92,377,92,382,100,378,100);
  triangle(392,96,381,100,391,157);
  quad(378,120,385,118,386,124,378,122);
  quad(380,120,378,110,383,110,385,118);
  triangle(380,120,378,110,374,112);
  quad(374,101,378,110,383,109,382,100);
  
  //Other Wing
  quad(380,121,396,129,396,151,380,178);
  quad(380,178,373,176,372,184,379,179);
  triangle(380,122,380,178,373,176);
  quad(365,180,373,176,380,122,371,119);
  quad(367,158,358,150,364,116,371,119);
  quad(347,147,358,150,364,116,355,113);
  quad(334,135,343,110,355,113,347,147);
  quad(308,119,326,104,343,110,334,135);
  quad(295,115,302,103,326,104,308,119);
  triangle(295,115,302,103,274,103);
  triangle(363,154,368,158,363,166);
  triangle(361,152,363,154,362,159);
  triangle(357,149,361,152,359,154);
  //Birdie Complete
}
