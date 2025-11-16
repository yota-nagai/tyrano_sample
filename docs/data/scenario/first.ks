;;;「画像の生成」は Google Gemini（2.5 Pro, 2.5 Flash）を使用（一部手書きによる作成もあり）;;;

*start
[title name="Midnight Lab : The Classified Mission"]
諜報員であるあなたは、極秘任務で敵国の研究所に潜入している。[l][r]
ミッションは、この深夜の闇に紛れ、研究所内に保管されている生物兵器サンプルを入手すること。[l][r]
夜明けがタイムリミットだ。[l][r]
[cm]
[jump target="*corridor"]

*corridor
[cm]
[bg storage="corridor.png" time="1000"] 
[position left=0 top=550 width=1280 height=300 visible=true]

[link target=*lab-chief]　　-->ラボ責任者室　　[endlink]
[link target=*duputy-lab-chief]　　-->副ラボ責任者室　　[endlink]
[link target=*data-analysis-room]　　-->データ解析室　　[endlink][r]
[link target=*B201]　　-->B201　　[endlink]
[link target=*B202]　　-->B202　　[endlink]
[link target=*B203]　　-->B203　　[endlink]
[link target=*break-room]　　-->休憩室　　[endlink]
[s]



*break-room
[cm]
なぜか、休憩室の扉にロックシステムがある[l][r]

*game-start
[cm]
[eval exp="f.answer = Math.floor(Math.random() * 1000) + 1"]
[eval exp="f.tries_left = 10"]

「If you want to take a break, guess a number 1 and 1000. You have 10 chances.」[l]
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

;[ptext layer="0" x="0" y="0" name="ptext" overwrite="true" text="&f.input"]
[return]

*C_break
[iscript]
f.input = f.input.substr(0, f.input.length - 1)
alert(f.input);
[endscript]
;[ptext layer="0" x="0" y="0" name="ptext" overwrite="true" text="&f.input"]
[return]

*E_break
[cm]
[freeimage layer="1"]
;hello [l]
;[clearfix name="numpad_break"]

[if exp="f.input == ''"]
    「Enter a number.」[l][r]
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
    「Higher」 [l][r]
[else]
    「Lower」 [l][r]
[endif]

[eval exp="f.input = ''"]
[jump target=*guess-loop]


*game-win
[cm]
[freeimage layer="0" name="input_display"]
「Congrats! Take it easy!」 [l]
[clearfix name="numpad_break"]
[cm]
[bg storage="break-room.png"]
休憩室に入った。 [l]
[cm]
部屋を歩き回るとホワイトボードを見つけた [l]
[cm]
[bg storage="whiteboard_break.png"]
[position left=0 top=580 width=1280 height=300 visible=true]
[link target=*corridor]　<<部屋を出る [endlink]
[s]

*game-over
[cm]
[freeimage layer="0" name="input_display"]

Too bad! You failed the challenge. The answer was [emb exp="f.answer"].[l]
[clearfix name="numpad_break"]
[cm]
[link target=*corridor]　-->廊下に戻る　[endlink]
[link target=*game-start]　-->再チャレンジ　[endlink]
[s]



*B201
[cm]
[bg storage="B201.png" time="500"]
[position left=0 top=550 width=1280 height=300 visible=true]
様々な実験装置が並んでいる。 [l]

*B201_machines
[cm]
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
[bg storage="freezer.png" time="500"]
[link target=*B201_machines]　<<戻る　[endlink]
[s]

*ultracentrifuge
[cm]
[bg storage="ultracentrifuge.png" time="500"]
[link target=*B201_machines]　<<戻る　[endlink]
[s]

*PCR-machine
[cm]
[bg storage="PCR-machine.png" time="500"]
[link target=*B201_machines]　<<戻る　[endlink]
[s]

*spectrophotometer
[cm]
[bg storage="spectrophotometer.png" time="500"]
[link target=*B201_machines]　<<戻る　[endlink]
[s]



*B202
[cm]
[bg storage="B202.png" time="500"] 
[position left=0 top=550 width=1280 height=300 visible=true]
PCが置いてある。スリーブ状態だ。[l]
[cm]

*wake-PC_emma
[cm]
[bg storage="PC_emma_pass.png" time="500"]
[position left=0 top=550 width=1280 height=300 visible=true]
[eval exp="f.input = prompt('Please enter your password')"]

[if exp="f.input == 'Bella'"]
    [wait time=500] 
    「Welcome」 [l][r]
    [jump target="PC_emma"]
[else]
    「Password is incorrect. Please try again.」[l][r]
    [r]
    [link target=*wake-PC_emma]　-->入力し直す　[endlink]
    [link target=*corridor]　-->部屋を出る　[endlink]
    [s]
[endif]


*PC_emma
[cm]
[bg storage="PC_emma_accessed.png"]
金魚の画像を眺めていたらしい。画像のプロパティも開いた痕跡がある [l][r]

*properties
[cm]
[freeimage layer="1" time="500"]
[link target=*goldfish_1]　-->画像1　[endlink]
[link target=*goldfish_2]　-->画像2　[endlink]
[link target=*goldfish_3]　-->画像3　[endlink]
[link target=*goldfish_4]　-->画像4　[endlink]
[link target=*goldfish_5]　-->画像5　[endlink][r]
[r]
[link target=*corridor]　-->部屋を出る　[endlink]
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
[bg storage="B203.png" time="500"]
[position left=0 top=550 width=1280 height=300 visible=true]
なにか手がかりはあるだろうか [l]

*B203_clues
[cm]
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
[bg storage="experimental-table.png" time="500"]
[link target=*B203_clues]　<<戻る [endlink]
[s]

*incubator
[cm]
[bg storage="incubator.png" time="500"]
[link target=*B203_clues]　<<戻る [endlink]
[s]

*desk_jack
[cm]
なにやら怪しいメッセージを見つけた [r]
[bg storage="desk_jack.png" time="500"]
[chara_new name="message_from_Kevin" storage="clue/message_from_Kevin.png"]
[chara_show name="message_from_Kevin" width=500 top = 50 layer="1"]
[r]
[link target=*B203_clues]　<<戻る [endlink]
[s]



*duputy-lab-chief
[cm]
ロックがかかっている [l]

*access-to-duputy
[cm]
[eval exp=" f.input = '' "]

[button graphic="../fgimage/numpad/1.png" x="500" y="160" width=70 exp=" tf.num = '1' " name="numpad_duputy" fix="true" target="*Input_duputy"]
[button graphic="../fgimage/numpad/2.png" x="578" y="160" width=70 exp=" tf.num = '2' " name="numpad_duputy" fix="true" target="*Input_duputy"]
[button graphic="../fgimage/numpad/3.png" x="656" y="160" width=70 exp=" tf.num = '3' " name="numpad_duputy" fix="true" target="*Input_duputy"]
[button graphic="../fgimage/numpad/4.png" x="500" y="238" width=70 exp=" tf.num = '4' " name="numpad_duputy" fix="true" target="*Input_duputy"]
[button graphic="../fgimage/numpad/5.png" x="578" y="238" width=70 exp=" tf.num = '5' " name="numpad_duputy" fix="true" target="*Input_duputy"]
[button graphic="../fgimage/numpad/6.png" x="656" y="238" width=70 exp=" tf.num = '6' " name="numpad_duputy" fix="true" target="*Input_duputy"]
[button graphic="../fgimage/numpad/7.png" x="500" y="316" width=70 exp=" tf.num = '7' " name="numpad_duputy" fix="true" target="*Input_duputy"]
[button graphic="../fgimage/numpad/8.png" x="578" y="316" width=70 exp=" tf.num = '8' " name="numpad_duputy" fix="true" target="*Input_duputy"]
[button graphic="../fgimage/numpad/9.png" x="656" y="316" width=70 exp=" tf.num = '9' " name="numpad_duputy" fix="true" target="*Input_duputy"]
[button graphic="../fgimage/numpad/0.png" x="578" y="394" width=70 exp=" tf.num = '0' " name="numpad_duputy" fix="true" target="*Input_duputy"]
[button graphic="../fgimage/numpad/C.png" x="500" y="394" width=70 name="numpad_duputy" fix="true" target="*C_duputy" ]
[button graphic="../fgimage/numpad/E.png" x="656" y="394" width=70 name="numpad_duputy" fix="True" target="*E_duputy" ]
[s]

*Input_duputy
[iscript]
if (f.input.length < 4) {
f.input = f.input + tf.num;
}
[endscript]

;[ptext layer="0" x="0" y="0" name="ptext" overwrite="true" text="&f.input"]
[return]

*C_duputy
[iscript]
f.input = f.input.substr(0, f.input.length - 1)
alert(f.input);
[endscript]
;[ptext layer="0" x="0" y="0" name="ptext" overwrite="true" text="&f.input"]
[return]

*E_duputy
[cm]
[freeimage layer="1"]
[clearfix name="numpad_duputy"]
[if exp="f.input==2135"]
    [cm]
    [bg storage="duputy-chief-room.png"]
    副ラボ責任者室への侵入に成功した。[l]
    [jump target="duputy-room"]
[else]
    「ACCESS DENIED」 [l][r]
    [r]
    [link target=*access-to-duputy]　-->もう一度 [endlink][r]
    [link target=*corridor]　-->部屋を出る [endlink]
    [s]
[endif]



*duputy-room
[cm]
[freeimage layer="1" time="500"]
[bg storage="duputy-chief-room.png"]
なにか手がかりはあるだろうか [l][r]
[link target=*whiteboard_paul]　-->ホワイトボード　[endlink]
[link target=*telephone]　-->電話機　[endlink]
[link target=*login-PC_paul]　-->PC [endlink][r]
[r]
[link target=*corridor]　<<部屋から出る　[endlink]
[s]

*whiteboard_paul
[cm]
[bg storage="whiteboard_paul.png" time="500"]
[link target=*duputy-room]　<<戻る [endlink]
[s]

*telephone
[cm]
[bg storage="telephone.png"]
[position left=0 top=550 width=1280 height=400 visible=true]
留守電メッセージが残っているようだ [l][r]
[cm]
「Dr. Paul Carter, it's James Anderson. I'm off-site from tonight. Use the Chief office for official communication while I'm away. The access code is two-five-six-four. That's all. I'll contact you later.」[r]
[link target=*duputy-room]　<<戻る [endlink]
[s]

*login-PC_paul
[cm]
[bg storage="PC_paul_PIN.png" time="500"]
[position left=0 top=550 width=1280 height=300 visible=true]
[eval exp="f.input = prompt('Please enter the PIN')"]
[if exp="f.input == '1013'"]
    [wait time=500] 
    「Welcome」 [l][r]
    [jump target="PC_paul"]
[else]
    「PIN is incorrect. Please try again.」[l][r]
    [link target=*login-PC_paul]　-->入力し直す　[endlink]
    [link target=*duputy-room]　<<戻る　[endlink]
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

[button graphic="../fgimage/directory-icon/dir0.png" x="40" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_2"]
[button graphic="../fgimage/directory-icon/dir1.png" x="130" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_2"]
[button graphic="../fgimage/directory-icon/dir2.png" x="220" y="350" width=65 exp=" f.correct = 1" fix="false" target="*layer_2"]
[button graphic="../fgimage/directory-icon/dir3.png" x="310" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_2"]
[button graphic="../fgimage/directory-icon/dir4.png" x="400" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_2"]
[button graphic="../fgimage/directory-icon/dir5.png" x="490" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_2"]
[button graphic="../fgimage/directory-icon/dir6.png" x="580" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_2"]
[button graphic="../fgimage/directory-icon/dir7.png" x="670" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_2"]
[button graphic="../fgimage/directory-icon/dir8.png" x="760" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_2"]
[button graphic="../fgimage/directory-icon/dir9.png" x="850" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_2"]
[s]

*layer_2
[cm]
2階層目
[if exp="f.correct == 1 || f.correct == 2"]
    [button graphic="../fgimage/directory-icon/dir0.png" x="40" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir1.png" x="130" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir2.png" x="220" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir3.png" x="310" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir4.png" x="400" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir5.png" x="490" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir6.png" x="580" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir7.png" x="670" y="350" width=65 exp=" f.correct = 2" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir8.png" x="760" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir9.png" x="850" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir_up.png" x="1030" y="350" width=65 fix="false" target="*layer_1"]
    [s]
[else]
    [button graphic="../fgimage/directory-icon/dir0.png" x="40" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir1.png" x="130" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir2.png" x="220" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir3.png" x="310" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir4.png" x="400" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir5.png" x="490" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir6.png" x="580" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir7.png" x="670" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir8.png" x="760" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir9.png" x="850" y="350" width=65 exp=" f.correct = 0" fix="false" target="*layer_3"]
    [button graphic="../fgimage/directory-icon/dir_up.png" x="1030" y="350" width=65 fix="false" target="*layer_1"]
    [s]
[endif]

*layer_3
[cm]
3階層目
[if exp="f.correct == 2"]
    [button graphic="../fgimage/directory-icon/dir0.png" x="40" y="350" width=65 exp=" f.correct = 0" fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir1.png" x="130" y="350" width=65 exp=" f.correct = 0" fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir2.png" x="220" y="350" width=65 exp=" f.correct = 0" fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir3.png" x="310" y="350" width=65 exp=" f.correct = 3" fix="false" target="*correct_route"]
    [button graphic="../fgimage/directory-icon/dir4.png" x="400" y="350" width=65 exp=" f.correct = 0" fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir5.png" x="490" y="350" width=65 exp=" f.correct = 0" fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir6.png" x="580" y="350" width=65 exp=" f.correct = 0" fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir7.png" x="670" y="350" width=65 exp=" f.correct = 0" fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir8.png" x="760" y="350" width=65 exp=" f.correct = 0" fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir9.png" x="850" y="350" width=65 exp=" f.correct = 0" fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir_up.png" x="1030" y="350" width=65 fix="false" target="*layer_2"]
    [s]
[else]
    [button graphic="../fgimage/directory-icon/dir0.png" x="40" y="350" width=65 exp=" f.correct = 0" fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir1.png" x="130" y="350" width=65 exp=" f.correct = 0" fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir2.png" x="220" y="350" width=65 exp=" f.correct = 0" fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir3.png" x="310" y="350" width=65 exp=" f.correct = 0" fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir4.png" x="400" y="350" width=65 exp=" f.correct = 0" fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir5.png" x="490" y="350" width=65 exp=" f.correct = 0" fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir6.png" x="580" y="350" width=65 exp=" f.correct = 0" fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir7.png" x="670" y="350" width=65 exp=" f.correct = 0" fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir8.png" x="760" y="350" width=65 exp=" f.correct = 0" fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir9.png" x="850" y="350" width=65 exp=" f.correct = 0" fix="false" target="*incorrect_route"]
    [button graphic="../fgimage/directory-icon/dir_up.png" x="1030" y="350" width=65 fix="false" target="*layer_2"]
    [s]
[endif]


*correct_route
[cm]
[chara_new name="button-rule" storage="clue/button-rule.png"]
[chara_show name="button-rule" width=600 top = 50 layer="1"]
謎のファイルを見つけた [l][r]
[r]
[link target=*duputy-room]　<<戻る [endlink]
[s]

*incorrect_route
[cm]
中身は空っぽだ [l][r]
[r]
[link target=*layer_1]　<<リトライする　[endlink][r]
[link target=*duputy-room]　<<あきらめる [endlink]
[s]



*lab-chief
[cm]
ロックがかかっている [r]

*access-to-chief-room
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
;[ptext layer="0" x="0" y="0" name="ptext" overwrite="true" text="&f.input"]
[return]

*C_chief
[iscript]
f.input = f.input.substr(0, f.input.length - 1)
alert(f.input);
[endscript]
;[ptext layer="0" x="0" y="0" name="ptext" overwrite="true" text="&f.input"]
[return]

*E_chief
[cm]
[freeimage layer="1"]
[clearfix name="numpad_chief"]
[if exp="f.input==2564"]
    [bg storage="chief-room.png" time="500"]
    ラボ責任者室への侵入に成功した。 [l]
    [jump target=*chief-room_inside]
[else]
    「ACCESS DENIED」 [l][r]
    [r]
    [link target=*access-to-chief-room]　-->リトライする [endlink][r]
    [link target=*corridor]　<<部屋を出る [endlink]
    [s]
[endif]


*chief-room_inside
[chara_new name="random-num-generator" storage="clue/random_num_generator.png"]
[chara_show name="random-num-generator" width=500 top = 250 layer="1"]
部屋の奥に奇妙な機械がある。 [r]
ボタンを押してみる。 [l][r]
[cm]

;最終セキュリティで桁ごとに比較するから文字列型にしとかなきゃダメだった
[eval exp="f.random_generated = (Math.floor(Math.random() * 90000) + 10000).toString()"]
「[emb exp="f.random_generated"]」と表示された[r]
[freeimage layer="1" time="1000"]
[r]
[link target=*corridor]　<<部屋を出る [endlink]
[s]



*data-analysis-room
[cm]
ロックがかかっている [l]

*access-to-analysis
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

;[ptext layer="0" x="0" y="0" name="ptext" overwrite="true" text="&f.input"]
[return]

*C_analysis
[iscript]
f.input = f.input.substr(0, f.input.length - 1)
alert(f.input);
[endscript]
;[ptext layer="0" x="0" y="0" name="ptext" overwrite="true" text="&f.input"]
[return]

*E_analysis
[cm]
[freeimage layer="1"]
[if exp="f.input == ''"]
    [jump target=*access-to-analysis]
[endif]
[eval exp="tf.guess = parseInt(f.input)"]
[if exp="tf.guess == 0628"]
    [clearfix name="numpad_analysis"]
    [bg storage="data-analysis-room.png"]
    データ解析室への侵入に成功した。 [l][r]
    奥には極めて頑丈そうな分厚い扉がそびえ立っている。[l]
    [jump target=*final-security-door]
[else]
    「ACCESS DENIED」 [l]
    [clearfix name="numpad_analysis"]
    [jump target=*corridor]
[endif]



*final-security-door
[cm]
[bg storage="final-security.png"]
[position left=0 top=550 width=1280 height=300]
この扉の先に目的のサンプルがありそうだ... [l]
[cm]
[eval exp="f.win_count = 0 "]
[jump target="*to-challenge-loop"]

*to-challenge-loop
[cm]
[link target=*challenge-loop]　-->ロック解除に進む　[endlink]
[link target=*corridor]　-->廊下に戻る　[endlink]
[s]

*challenge-loop
[cm]
[button graphic="../fgimage/color/red.png" x="250" y="350" width=150 exp=" tf.num = '0' " name="color_button" fix="false" target="*check_answer"]
[button graphic="../fgimage/color/blue.png" x="450" y="350" width=150 exp=" tf.num = '1' " name="color_button" fix="false" target="*check_answer"]
[button graphic="../fgimage/color/green.png" x="650" y="350" width=150 exp=" tf.num = '2' " name="color_button" fix="false" target="*check_answer"]
[button graphic="../fgimage/color/yellow.png" x="850" y="350" width=150 exp=" tf.num = '3' " name="color_button" fix="false" target="*check_answer"]
[s] 

*check_answer
[if exp="tf.num == f.random_generated[f.win_count]%4"]
    yeaaaaaaa! [l]
    [eval exp="f.win_count++"]
    [jump target="*check_clear"]
[else]
    noooooooo [l]
    「ACCESS DENIED」[l][r]
    [eval exp="f.win_count = 0"]
    [jump target="*to-challenge-loop"]
[endif]

*check_clear
[if exp="f.win_count == 5"]
    [jump target="*final_complete"]
[else]
    [jump target="*challenge-loop"]
[endif]

*final_complete
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
[chara_show name="target" width=800 top = 50 layer="1"]
目的のサンプルを手に入れた。任務完了だ。 [l][r]
夜明けは近い。[r]
あなたはサンプルを携え、帰還する。[r]
はやくも次の指令が届いている。[l]
[freeimage layer="1" time="500"]
[cm]
[bg storage="black" time="1000"]
Thank you for playing!! [l]
[cm]
[link target=*start]　>>>スタート画面へ [endlink]　






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;10日間の全力の奮闘の末、ついに完成！！！！！！！！！！！！！！！！！！   2025/11/16 ;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;