function soundmatrix = playsnmn(name,func,bdura,fs)
%playsnmn - 直接从snmn格式文件转换出音频信号矩阵并播放，需给定单音生成函数等。
%
%    soundmatrix = playsnmn(name,func,bdura,fs)
%
%    name
%       给定的snmn格式文件名。
%
%    func
%        生成单音的函数。该函数的前三个参数应为表示一个音的struct、一拍以秒为单
%        位的实际时长和每秒采样数，返回生成的声音信号单行矩阵。
%
%    bdura
%        一拍以秒为单位的实际时长，将作为参数传递给func。
%
%    fs
%        每秒采样数。
%
%    返回生成的音频信号单行矩阵。
    
  soundmatrix=snmn.str2sound(snmn.readtxt(name),func,bdura,fs);
  soundsc(soundmatrix,fs);

end