;;;「画像の生成」は Google Gemini（2.5 Pro, 2.5 Flash）を使用（一部手書きによる作成もあり）;;;

*start
[title name="Midnight　Lab　:　The　Classified　Mission"]
[cm]
[position left=0 top=550 width=1300 height=300]
[wait time=1500]
諜報員であるあなたは、極秘任務で敵国の研究所に潜入している。[l][r]
ミッションは、この深夜の闇に紛れ、研究所内に保管されている生物兵器サンプルを入手すること。[l][r]
夜明けがタイムリミットだ。[l][r]
[cm]
[eval exp="f.final_fail = 0"]
[jump target="*corridor"]



*corridor
[cm]
[position left=0 top=600 width=1300 height=300]
[bg storage="corridor.png" time=1000] 
[link target=*lab-chief]　　-->ラボ責任者室　　[endlink]
[link target=*deputy-lab-chief]　　-->副ラボ責任者室　　[endlink]
[link target=*data-analysis-room]　　-->データ解析室　　[endlink][r]
[link target=*B201]　　-->B201　　[endlink]
[link target=*B202]　　-->B202　　[endlink]
[link target=*B203]　　-->B203　　[endlink]
[link target=*break-room]　　-->休憩室　　[endlink]
[s]



*break-room
[cm]
なぜか、休憩室の扉にロックシステムがある。[l][r]

*game-start
[cm]
[eval exp="f.answer = Math.floor(Math.random() * 1000) + 1"]
[eval exp="f.tries_left = 10"]
If you want to take a break, guess a number between 1 and 1000. You have 10 chances. [l]
[cm]
[jump target=*guess-loop]


*guess-loop

;;;テンキーの実装は次を参考にした
;;;https://github.com/appi-github/yagapon/blob/main/docs/data/scenario/first.ks
;;;他の箇所に使われる文法についても参照した

[eval exp="f.input = ''"]
[button graphic="../fgimage/numpad/1.png" x="500" y="160" width=70 exp=" tf.num = '1' " name="numpad_break" fix="true" target="*Input_break"]
[button graphic="../fgimage/numpad/2.png" x="578" y="160" width=70 exp=" tf.num = '2' " name="numpad_break" fix="true" target="*Input_break"]
[button graphic="../fgimage/numpad/3.png" x="656" y="160" width=70 exp=" tf.num = '3' " name="numpad_break" fix="true" target="*Input_break"]
[button graphic="../fgimage/numpad/4.png" x="500" y="238" width=70 exp=" tf.num = '4' " name="numpad_break" fix="true" target="*Input_break"]
[button graphic="../fgimage/numpad/5.png" x="578" y="238" width=70 exp=" tf.num = '5' " name="numpad_break" fix="true" target="*Input_break"]
[button graphic="../fgimage/numpad/6.png" x="656" y="238" width=70 exp=" tf.num = '6' " name="numpad_break" fix="true" target="*Input_break"]
[button graphic="../fgimage/numpad/7.png" x="500" y="316" width=70 exp=" tf.num = '7' " name="numpad_break" fix="true" target="*Input_break"]
[button graphic="../fgimage/numpad/8.png" x="578" y="316" width=70 exp=" tf.num = '8' " name="numpad_break" fix="true" target="*Input_break"]
[button graphic="../fgimage/numpad/9.png" x="656" y="316" width=70 exp=" tf.num = '9' " name="numpad_break" fix="true" target="*Input_break"]
[button graphic="../fgimage/numpad/0.png" x="578" y="394" width=70 exp=" tf.num = '0' " name="numpad_break" fix="true" target="*Input_break"]
[button graphic="../fgimage/numpad/C.png" x="500" y="394" width=70 name="numpad_break" fix="true" target="*C_break" ]
[button graphic="../fgimage/numpad/E.png" x="656" y="394" width=70 name="numpad_break" fix="True" target="*E_break" ]
[s]

*Input_break
[iscript]
if (f.input.length < 4) {
f.input = f.input + tf.num;
}
[endscript]
[return]

*C_break
[iscript]
f.input = ""
[endscript]
[return]

*E_break
[cm]

[if exp="f.input == ''"]
    Enter a number.
    [jump target=*guess-loop]
[endif]

[eval exp="tf.guess = parseInt(f.input)"]
[eval exp="f.tries_left--"]

[if exp="tf.guess == f.answer"]
    [clearfix name="numpad_break"]
    [jump target=*game-win]
[endif]

[if exp="f.tries_left <= 0"]
    [jump target=*game-over]
[endif]

[if exp="tf.guess < f.answer"]
    You entered "[emb exp="tf.guess"]"...　Higher.
[else]
    You entered "[emb exp="tf.guess"]"...　Lower. 
[endif]

[eval exp="f.input = ''"]
[jump target=*guess-loop]


*game-win
[cm]
Congrats! Take it easy! [l]
[clearfix name="numpad_break"]
[cm]
[bg storage="break-room.png"]
休憩室に入った。 [l]
[cm]
部屋を歩き回るとホワイトボードを見つけた。 [l]
[cm]
[bg storage="whiteboard_break.png"]
[position left=0 top=600 width=1300 height=300]
[link target=*corridor]　<<部屋を出る [endlink]
[s]

*game-over
[cm]
Too bad! You failed the challenge. The answer was "[emb exp="f.answer"]". [l]
[clearfix name="numpad_break"]
[cm]
[link target=*game-start]　<リトライ　[endlink][r]
[link target=*corridor]　<<あきらめる　[endlink]
[s]



*B201
[cm]
[bg storage="B201.png" time=500]
[position left=0 top=550 width=1280 height=300]
様々な実験装置が並んでいる。 [l]

*B201_machines
[cm]
[position left=0 top=550 width=1300 height=350]
[bg storage="B201.png" time="500"]
[link target=*freezer]　-->超低温フリーザー　[endlink]
[link target=*ultracentrifuge]　-->高速遠心分離機　[endlink][r]
[link target=*PCR-machine]　-->PCR装置　[endlink]
[link target=*spectrophotometer]　　　　　-->分光光度計　[endlink][r]
[r]
[link target=*corridor]　<<部屋を出る[endlink]
[s]

*freezer
[cm]
[position left=0 top=630 width=1300 height=300]
[bg storage="freezer.png" time=500]
[link target=*B201_machines]　<<戻る　[endlink]
[s]

*ultracentrifuge
[cm]
[position left=0 top=630 width=1300 height=300]
[bg storage="ultracentrifuge.png" time=500]
[link target=*B201_machines]　<<戻る　[endlink]
[s]

*PCR-machine
[cm]
[position left=0 top=630 width=1300 height=300]
[bg storage="PCR-machine.png" time=500]
[link target=*B201_machines]　<<戻る　[endlink]
[s]

*spectrophotometer
[cm]
[position left=0 top=630 width=1300 height=300]
[bg storage="spectrophotometer.png" time=500]
[link target=*B201_machines]　<<戻る　[endlink]
[s]



*B202
[cm]
[position left=0 top=600 width=1300 height=300]
[bg storage="B202.png" time=500] 
PCが置いてある。スリーブ状態だ。[l]
[cm]

*wake-PC_emma
[cm]
[position left=0 top=600 width=1300 height=300]
[bg storage="PC_emma_pass.png" time=500]
;;;ポップアップウィンドウを出すのではなく、ゲーム内のPCに直接入力しているかのように思える仕様に変えた
[button graphic="../fgimage/PC/login.png" x="630" y="500" width=80 target="*check_pass_emma"]
[edit name="f.input" left=520 top=465 width=300 height=20]
[s]

*check_pass_emma
[commit name="f.input"]
[if exp="f.input == 'Bella'"]
    [wait time=500] 
    Welcome 
    [wait time=1000]
    [jump target="PC_emma"]
[else]
    Password is incorrect. Please try again. [l]
    [r]
    [position left=0 top=600 width=1300 height=300]
    [cm]
    [link target=*wake-PC_emma]　<リトライ　[endlink][r]
    [link target=*corridor]　<<部屋を出る　[endlink]
    [s]
[endif]


*PC_emma
[cm]
[position left=0 top=600 width=1300 height=300]
[bg storage="PC_emma_accessed.png" time=1000]
金魚の画像を眺めていたらしい。画像のプロパティも開いた痕跡がある。 [l][r]

*properties
[position left=0 top=580 width=1300 height=300]
[cm]
[freeimage layer="1" time="500"]
[link target=*goldfish_1]　-->画像1　[endlink]
[link target=*goldfish_2]　-->画像2　[endlink]
[link target=*goldfish_3]　-->画像3　[endlink]
[link target=*goldfish_4]　-->画像4　[endlink]
[link target=*goldfish_5]　-->画像5　[endlink][r]
[r]
[link target=*corridor]　<<部屋を出る　[endlink]
[s]

*goldfish_1
[cm]
[chara_new name="fish_1" storage="clue/goldfish_1.png"]
[chara_show name="fish_1" width=800 top = 50 layer="1"]
[link target=*properties]　<<戻る [endlink]
[s]

*goldfish_2
[cm]
[chara_new name="fish_2" storage="clue/goldfish_2.png"]
[chara_show name="fish_2" width=800 top = 50 layer="1"]
[link target=*properties]　<<戻る [endlink]
[s]

*goldfish_3
[cm]
[chara_new name="fish_3" storage="clue/goldfish_3.png"]
[chara_show name="fish_3" width=800 top = 50 layer="1"]
[link target=*properties]　<<戻る [endlink]
[s]

*goldfish_4
[cm]
[chara_new name="fish_4" storage="clue/goldfish_4.png"]
[chara_show name="fish_4" width=800 top = 50 layer="1"]
[link target=*properties]　<<戻る [endlink]
[s]

*goldfish_5
[cm]
[chara_new name="fish_5" storage="clue/goldfish_5.png"]
[chara_show name="fish_5" width=800 top = 50 layer="1"]
[link target=*properties]　<<戻る [endlink]
[s]



*B203
[cm]
[position left=0 top=600 width=1300 height=300]
[bg storage="B203.png" time="500"]
なにか手がかりはあるだろうか。 [l]

*B203_clues
[cm]
[position left=0 top=570 width=1280 height=300]
[freeimage layer="1" time="500"]
[bg storage="B203.png" time="500"]
[link target=*experimental-table]　-->実験台　[endlink]
[link target=*incubator]　-->恒温槽　[endlink]
[link target=*desk_jack]　-->デスク　[endlink][r]
[r]
[link target=*corridor]　<<部屋を出る　[endlink]
[s]

*experimental-table
[cm]
[position left=0 top=600 width=1280 height=300]
[bg storage="experimental-table.png" time="500"]
[link target=*B203_clues]　<<戻る [endlink]
[s]

*incubator
[cm]
[position left=0 top=600 width=1280 height=300]
[bg storage="incubator.png" time="500"]
[link target=*B203_clues]　<<戻る [endlink]
[s]

*desk_jack
[cm]
[position left=0 top=560 width=1280 height=300]
[bg storage="desk_jack.png" time="500"]
なにやら怪しいメッセージを見つけた。 [l]
[chara_new name="message_from_Kevin" storage="clue/message_from_Kevin.png"]
[chara_show name="message_from_Kevin" width=800 top = 100 layer="1"]
[r]
[r]
[link target=*B203_clues]　<<戻る [endlink]
[s]



*deputy-lab-chief
[cm]
ロックがかかっている。 [l]

*access-to-deputy
[cm]
[eval exp=" f.input = '' "]

[button graphic="../fgimage/numpad/1.png" x="500" y="160" width=70 exp=" tf.num = '1' " name="numpad_deputy" fix="true" target="*Input_deputy"]
[button graphic="../fgimage/numpad/2.png" x="578" y="160" width=70 exp=" tf.num = '2' " name="numpad_deputy" fix="true" target="*Input_deputy"]
[button graphic="../fgimage/numpad/3.png" x="656" y="160" width=70 exp=" tf.num = '3' " name="numpad_deputy" fix="true" target="*Input_deputy"]
[button graphic="../fgimage/numpad/4.png" x="500" y="238" width=70 exp=" tf.num = '4' " name="numpad_deputy" fix="true" target="*Input_deputy"]
[button graphic="../fgimage/numpad/5.png" x="578" y="238" width=70 exp=" tf.num = '5' " name="numpad_deputy" fix="true" target="*Input_deputy"]
[button graphic="../fgimage/numpad/6.png" x="656" y="238" width=70 exp=" tf.num = '6' " name="numpad_deputy" fix="true" target="*Input_deputy"]
[button graphic="../fgimage/numpad/7.png" x="500" y="316" width=70 exp=" tf.num = '7' " name="numpad_deputy" fix="true" target="*Input_deputy"]
[button graphic="../fgimage/numpad/8.png" x="578" y="316" width=70 exp=" tf.num = '8' " name="numpad_deputy" fix="true" target="*Input_deputy"]
[button graphic="../fgimage/numpad/9.png" x="656" y="316" width=70 exp=" tf.num = '9' " name="numpad_deputy" fix="true" target="*Input_deputy"]
[button graphic="../fgimage/numpad/0.png" x="578" y="394" width=70 exp=" tf.num = '0' " name="numpad_deputy" fix="true" target="*Input_deputy"]
[button graphic="../fgimage/numpad/C.png" x="500" y="394" width=70 name="numpad_deputy" fix="true" target="*C_deputy" ]
[button graphic="../fgimage/numpad/E.png" x="656" y="394" width=70 name="numpad_deputy" fix="True" target="*E_deputy" ]
[s]

*Input_deputy
[iscript]
if (f.input.length < 4) {
f.input = f.input + tf.num;
}
[endscript]
[return]

*C_deputy
[iscript]
f.input = ""
[endscript]
[return]

*E_deputy
[cm]
[clearfix name="numpad_deputy"]
[position left=0 top=530 width=1300 height=300]
[if exp="f.input==2135"]
    ACCESS GRANTED
    [wait time=1200]
    [cm]
    [position left=0 top=600 width=1300 height=300]
    [bg storage="deputy-chief-room.png"]
    副ラボ責任者室への侵入に成功した。[l]
    [jump target="deputy-room"]
[else]
    ACCESS DENIED [r]
    [r]
    [link target=*access-to-deputy]　<リトライ [endlink][r]
    [link target=*corridor]　<<やめる [endlink]
    [s]
[endif]

*deputy-room
[cm]
[freeimage layer=1]
[position left=0 top=580 width=1300 height=300]
[bg storage="deputy-chief-room.png"]
[link target=*whiteboard_paul]　-->ホワイトボード　[endlink]
[link target=*telephone]　-->電話機　[endlink]
[link target=*login-PC_paul]　-->PC [endlink][r]
[r]
[link target=*corridor]　<<部屋から出る　[endlink]
[s]

*whiteboard_paul
[cm]
[position left=0 top=600 width=1300 height=300]
[bg storage="whiteboard_paul.png" time="500"]
[link target=*deputy-room]　<<戻る [endlink]
[s]

*telephone
[cm]
[position left=0 top=500 width=1280 height=400]
[bg storage="telephone.png"]
留守電メッセージが残っているようだ。 [l][r]
[cm]
"Dr. Paul Carter, it's James Anderson. I'm off-site starting tonight. Use the Chief office for official communication while I'm away. The access code is nine-seven-eight-five. I'll contact you later." [r]
[r]
[link target=*deputy-room]　<<戻る [endlink]
[s]

*login-PC_paul
[cm]
[bg storage="PC_paul_PIN.png" time="500"]
[button graphic="../fgimage/PC/login.png" x=541 y=328 width=227 height=35 target=*check_PIN_paul]
[edit name="f.input" left=455 top=265 width=420 height=39]
[s]

*check_PIN_paul
[commit name="f.input"]
[if exp="f.input == '1011'"]
    Welcome 
    [wait time=1000] 
    [jump target="PC_paul"]
[else]
    PIN is incorrect. Please try again. [l][r]
    [cm]
    [link target=*login-PC_paul]　<リトライ　[endlink][r]
    [link target=*deputy-room]　<<やめる　[endlink]
    [s]
[endif]


*PC_paul
[cm]
[bg storage="PC_paul_accessed.png"]
なにやら大量のディレクトリがある。 [l]
[eval exp="f.correct = 0"]
[jump target="*layer_1"]

*layer_1
[cm]
1階層目
;;expとかを入れ込みたい場合、[link]じゃなく[button]を使う！
;;[link]にはstorage・targetしか指定できないらしい、、、愚直に実装

[button graphic="../fgimage/directory-icon/dir0.png" x="120" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_2"]
[button graphic="../fgimage/directory-icon/dir1.png" x="210" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_2"]
[button graphic="../fgimage/directory-icon/dir2.png" x="300" y="350" width=65 exp=" f.correct = 1" fix="false" target="*layer_2"]
[button graphic="../fgimage/directory-icon/dir3.png" x="390" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_2"]
[button graphic="../fgimage/directory-icon/dir4.png" x="480" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_2"]
[button graphic="../fgimage/directory-icon/dir5.png" x="570" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_2"]
[button graphic="../fgimage/directory-icon/dir6.png" x="660" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_2"]
[button graphic="../fgimage/directory-icon/dir7.png" x="750" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_2"]
[button graphic="../fgimage/directory-icon/dir8.png" x="840" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_2"]
[button graphic="../fgimage/directory-icon/dir9.png" x="930" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_2"]
[s]


;;フラグ管理（f.correct）が正しく行われるように　上の階層に戻るケースに注意
*layer_2
[cm]
2階層目
[if exp="f.correct == 1 || f.correct == 2"]
    [button graphic="../fgimage/directory-icon/dir0.png" x="120" y="350" width=65 exp=" f.correct = 1" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir1.png" x="210" y="350" width=65 exp=" f.correct = 1" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir2.png" x="300" y="350" width=65 exp=" f.correct = 1" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir3.png" x="390" y="350" width=65 exp=" f.correct = 1" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir4.png" x="480" y="350" width=65 exp=" f.correct = 1" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir5.png" x="570" y="350" width=65 exp=" f.correct = 1" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir6.png" x="660" y="350" width=65 exp=" f.correct = 1" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir7.png" x="750" y="350" width=65 exp=" f.correct = 2" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir8.png" x="840" y="350" width=65 exp=" f.correct = 1" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir9.png" x="930" y="350" width=65 exp=" f.correct = 1" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir_up.png" x="1110" y="350" width=65 fix="false" target="*layer_1"]
    [s]
[else]
    [button graphic="../fgimage/directory-icon/dir0.png" x="120" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir1.png" x="210" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir2.png" x="300" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir3.png" x="390" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir4.png" x="480" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir5.png" x="570" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir6.png" x="660" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir7.png" x="750" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir8.png" x="840" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir9.png" x="930" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir_up.png" x="1110" y="350" width=65 fix="false" target="*layer_1"]
    [s]
[endif]

*layer_3
[cm]
3階層目
[if exp="f.correct == 2"]
    [button graphic="../fgimage/directory-icon/dir0.png" x="120" y="350" width=65 fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir1.png" x="210" y="350" width=65 fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir2.png" x="300" y="350" width=65 fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir3.png" x="390" y="350" width=65 fix="false" target="*correct_route"]
    [button graphic="../fgimage/directory-icon/dir4.png" x="480" y="350" width=65 fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir5.png" x="570" y="350" width=65 fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir6.png" x="660" y="350" width=65 fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir7.png" x="750" y="350" width=65 fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir8.png" x="840" y="350" width=65 fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir9.png" x="930" y="350" width=65 fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir_up.png" x="1110" y="350" width=65 fix="false" target="*layer_2"]
    [s]
[else]
    [button graphic="../fgimage/directory-icon/dir0.png" x="120" y="350" width=65 fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir1.png" x="210" y="350" width=65 fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir2.png" x="300" y="350" width=65 fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir3.png" x="390" y="350" width=65 fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir4.png" x="480" y="350" width=65 fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir5.png" x="570" y="350" width=65 fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir6.png" x="660" y="350" width=65 fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir7.png" x="750" y="350" width=65 fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir8.png" x="840" y="350" width=65 fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir9.png" x="930" y="350" width=65 fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir_up.png" x="1110" y="350" width=65 fix="false" target="*layer_2"]
    [s]
[endif]


*correct_route
[cm]
[position left=0 top=600 width=1280 height=300]
lock_logic.txtというファイルを見つけた。 [l][r]
[chara_new name="button-rule" storage="clue/button-rule.png"]
[chara_show name="button-rule" width=600 top = 50 layer=1]
[cm]
[link target=*deputy-room]　<<戻る [endlink]
[s]

*incorrect_route
[cm]
[position left=0 top=550 width=1280 height=300]
中身は空っぽだ。 [l][r]
[r]
[link target=*layer_1]　<最初からたどる　[endlink][r]
[link target=*deputy-room]　<<やめる [endlink]
[s]



*lab-chief
[cm]
ロックがかかっている。 [l][r]

*access-to-chief-room
[cm]
[eval exp=" f.input = '' "]
[button graphic="../fgimage/numpad/1.png" x="500" y="160" width=70 exp=" tf.num = '1' " name="numpad_chief" fix="true" target="*Input_chief"]
[button graphic="../fgimage/numpad/2.png" x="578" y="160" width=70 exp=" tf.num = '2' " name="numpad_chief" fix="true" target="*Input_chief"]
[button graphic="../fgimage/numpad/3.png" x="656" y="160" width=70 exp=" tf.num = '3' " name="numpad_chief" fix="true" target="*Input_chief"]
[button graphic="../fgimage/numpad/4.png" x="500" y="238" width=70 exp=" tf.num = '4' " name="numpad_chief" fix="true" target="*Input_chief"]
[button graphic="../fgimage/numpad/5.png" x="578" y="238" width=70 exp=" tf.num = '5' " name="numpad_chief" fix="true" target="*Input_chief"]
[button graphic="../fgimage/numpad/6.png" x="656" y="238" width=70 exp=" tf.num = '6' " name="numpad_chief" fix="true" target="*Input_chief"]
[button graphic="../fgimage/numpad/7.png" x="500" y="316" width=70 exp=" tf.num = '7' " name="numpad_chief" fix="true" target="*Input_chief"]
[button graphic="../fgimage/numpad/8.png" x="578" y="316" width=70 exp=" tf.num = '8' " name="numpad_chief" fix="true" target="*Input_chief"]
[button graphic="../fgimage/numpad/9.png" x="656" y="316" width=70 exp=" tf.num = '9' " name="numpad_chief" fix="true" target="*Input_chief"]
[button graphic="../fgimage/numpad/0.png" x="578" y="394" width=70 exp=" tf.num = '0' " name="numpad_chief" fix="true" target="*Input_chief"]
[button graphic="../fgimage/numpad/C.png" x="500" y="394" width=70 name="numpad_chief" fix="true" target="*C_chief" ]
[button graphic="../fgimage/numpad/E.png" x="656" y="394" width=70 name="numpad_chief" fix="True" target="*E_chief" ]
[s]

*Input_chief
[iscript]
if (f.input.length < 4) {
f.input = f.input + tf.num;
}
[endscript]
[return]

*C_chief
[iscript]
f.input = ""
[endscript]
[return]

*E_chief
[cm]
[clearfix name="numpad_chief"]
[if exp="f.input==9785"]
    ACCESS GRANTED
    [wait time=1200]
    [cm]
    [bg storage="chief-room.png" time="500"]
    ラボ責任者室への侵入に成功した。 [l]
    [jump target=*chief-room_inside]
[else]
    [position left=0 top=550 width=1280 height=300]
    ACCESS DENIED [l][r]
    [r]
    [link target=*access-to-chief-room]　-->リトライ [endlink][r]
    [link target=*corridor]　<<やめる [endlink]
    [s]
[endif]


*chief-room_inside
[cm]
部屋の奥に奇妙な機械がある。 [l][r]
[chara_new name="random-num-generator" storage="clue/random_num_generator.png"]
[chara_show name="random-num-generator" width=500 top = 250 layer="1"]
[cm]
ボタンを押してみる。 [l][r]
[cm]

;最終セキュリティで桁ごとに比較するから文字列型にしとかなきゃダメだった
[eval exp="f.random_generated = (Math.floor(Math.random() * 90000) + 10000).toString()"]
[eval exp="f.final_fail = 0"]
[position left=0 top=550 width=1280 height=300]
「[emb exp="f.random_generated"]」と表示された。[l][r]
[freeimage layer="1" time="1000"]
[r]
[link target=*corridor]　<<部屋を出る [endlink]
[s]



*data-analysis-room
[cm]
ロックがかかっている。 [l]

*access-to-analysis
[cm]
[eval exp="f.input = ''"]
[button graphic="../fgimage/numpad/1.png" x="500" y="160" width=70 exp=" tf.num = '1' " name="numpad_analysis" fix="true" target="*Input_analysis"]
[button graphic="../fgimage/numpad/2.png" x="578" y="160" width=70 exp=" tf.num = '2' " name="numpad_analysis" fix="true" target="*Input_analysis"]
[button graphic="../fgimage/numpad/3.png" x="656" y="160" width=70 exp=" tf.num = '3' " name="numpad_analysis" fix="true" target="*Input_analysis"]
[button graphic="../fgimage/numpad/4.png" x="500" y="238" width=70 exp=" tf.num = '4' " name="numpad_analysis" fix="true" target="*Input_analysis"]
[button graphic="../fgimage/numpad/5.png" x="578" y="238" width=70 exp=" tf.num = '5' " name="numpad_analysis" fix="true" target="*Input_analysis"]
[button graphic="../fgimage/numpad/6.png" x="656" y="238" width=70 exp=" tf.num = '6' " name="numpad_analysis" fix="true" target="*Input_analysis"]
[button graphic="../fgimage/numpad/7.png" x="500" y="316" width=70 exp=" tf.num = '7' " name="numpad_analysis" fix="true" target="*Input_analysis"]
[button graphic="../fgimage/numpad/8.png" x="578" y="316" width=70 exp=" tf.num = '8' " name="numpad_analysis" fix="true" target="*Input_analysis"]
[button graphic="../fgimage/numpad/9.png" x="656" y="316" width=70 exp=" tf.num = '9' " name="numpad_analysis" fix="true" target="*Input_analysis"]
[button graphic="../fgimage/numpad/0.png" x="578" y="394" width=70 exp=" tf.num = '0' " name="numpad_analysis" fix="true" target="*Input_analysis"]
[button graphic="../fgimage/numpad/C.png" x="500" y="394" width=70 name="numpad_analysis" fix="true" target="*C_analysis" ]
[button graphic="../fgimage/numpad/E.png" x="656" y="394" width=70 name="numpad_analysis" fix="True" target="*E_analysis" ]
[s]

*Input_analysis
[iscript]
if (f.input.length < 4) {
f.input = f.input + tf.num;
}
[endscript]
[return]

*C_analysis
[iscript]
f.input=""
[endscript]
[return]

*E_analysis
[cm]
[clearfix name="numpad_analysis"]
[eval exp="tf.guess = parseInt(f.input)"]
[if exp="tf.guess == 0628"]
    ACCESS GRANTED
    [wait time=1200]
    [cm]
    [position left=0 top=580 width=1300 height=300]
    [bg storage="data-analysis-room.png"]
    データ解析室への侵入に成功した。 [l][r]
    奥には極めて頑丈そうな分厚い扉がそびえ立っている。[l]
    [jump target=*final-security-door]
[else]
    [position left=0 top=550 width=1300 height=300]
    ACCESS DENIED [r]
    [r]
    [link target=*access-to-analysis]　<リトライ [endlink][r]
    [link target=*corridor]　<<やめる [endlink]
    [s]
[endif]


*final-security-door
[cm]
[position left=0 top=600 width=1280 height=300]
[bg storage="final-security.png"]
この扉の先に目的のサンプルがありそうだ... [l]
[cm]
[eval exp="f.win_count = 0 "]
[jump target="*to-challenge-loop"]

*to-challenge-loop
[cm]
[position left=0 top=580 width=1280 height=300]
[link target=*challenge-loop]　-->ロック解除　[endlink][r]
[r]
[link target=*corridor]　<<部屋を出る　[endlink]
[s]

*challenge-loop
[cm]
[button graphic="../fgimage/color/red.png" x="250" y="350" width=150 exp=" tf.num = '0' " name="color_button" fix="false" target="*check_answer"]
[button graphic="../fgimage/color/blue.png" x="450" y="350" width=150 exp=" tf.num = '1' " name="color_button" fix="false" target="*check_answer"]
[button graphic="../fgimage/color/green.png" x="650" y="350" width=150 exp=" tf.num = '2' " name="color_button" fix="false" target="*check_answer"]
[button graphic="../fgimage/color/yellow.png" x="850" y="350" width=150 exp=" tf.num = '3' " name="color_button" fix="false" target="*check_answer"]
[s] 


;;;失敗回数制限を追加した
*check_answer
[if exp="tf.num == f.random_generated[f.win_count]%4"]
    [eval exp="f.win_count++"]
    [jump target="*check_clear"]
[else]
    [eval exp="f.win_count = 0"]
    [eval exp="f.final_fail++"]
    [if exp="f.final_fail==1"]
        ACCESS DENIED [l]
        [jump target=*to-challenge-loop]
    [elsif exp="f.final_fail==2"]
        WARNING: ONE ATTEMPT REMAINING [l]
        [jump target="*to-challenge-loop"]
    [else]
        SYSTEM LOCKDOWN INITIATED [l]
        [jump target="*mission_failed"]
    [endif]
[endif]


*check_clear
[if exp="f.win_count == 5"]
    [jump target="*mission_complete"]
[else]
    [jump target="*challenge-loop"]
[endif]


*mission_failed
[cm]
;blackという画像ファイルは無いが、むりやり画面を真っ暗にするために
[bg storage="black" time=1000]
[position left=0 top=450 width=1280 height=300]
次の瞬間、けたたましい警報音が耳をつんざき、部屋全体が赤色に染まった。[r]
鈍く重い金属が噛み合う音が響き、出入り口は内側から完全に封鎖された。[l][r]
[r]
完全な密室。[r]
ここから出られないことを悟った。 [l]
[cm]
[wait time=2000]
[position left=450 top=280 width=1300 height=300]
　ーーミッション失敗ーー [r]
[r]
[r]
[r]
[r]
[link target=*start]　>>>スタート画面へ [endlink]
[s]


*mission_complete
[cm]
[p]
ピピピ... [l]
分厚い金属が擦れるような鈍い音と共に、扉が静かに開く。[l]
[cm]
[bg storage="top-secret-room.png"]
侵入成功。[r]
サンプルが確かに保管されている。[l]
[cm]
[chara_new name="target" storage="target/final-target.png"]
[chara_show name="target" width=750 top = 20 layer="1"]
目的のサンプルを手に入れた。[r]
任務完了だ。[l]
[cm]
[position width=0 height=0]
[wait time=1200]
[freeimage layer="1" time="500"]
[cm]
[bg storage="black" time=1000]
[position left=0 top=550 width=1280 height=300]
夜明けは近い。[r]
あなたはサンプルを携え、帰還する。[r]
早くも次の指令が届いている。[l]
[cm]
[wait time=2000]
[position left=450 top=280 width=1300 height=300]
ーーミッションクリアーー [r]
[r]
Thank you for playing!! [l]
[cm]
[link target=*start]　>>>スタート画面へ [endlink]　

