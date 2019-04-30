function frequence = freq(note,lh,half)
%freq - 返回对应音高的频率，暂时只支持C调的低中高三段共12*7=84个音高。
%
%    frequence = freq
%
%    note
%        音高符号，以数字而非字符形式指定。
%
%    lh
%        指示相对C调降低或升高几个7个音。升高为正，降低为负，不变为0。
%
%    half
%        指示升或降半个音。升为1，将为-1，不升降为0。
%
%    返回对应音高的频率

  freqs=[262,277,294,311,330,349,370,392,415,440,466,494;
        523,554,587,622,659,698,740,784,831,880,932,988;
        1046,1109,1175,1245,1318,1397,1480,1568,1661,1760,1865,1976];
  
  col=0;
  switch (note)
    case 0
      frequence=0;
      return;
    case 1
      col=1;
    case 2
      col=3;
    case 3
      col=5;
    case 4
      col=6;
    case 5
      col=8;
    case 6
      col=10;
    case 7
      col=12;
    otherwise
      error("The 'note' is out of range.");
  end
  col=col+half;
  frequence=freqs(2+lh,col);

end