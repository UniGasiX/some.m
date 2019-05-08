function [soundm,tmpstruct] = genwave_expdamp(strct,bdura,fs,tempstruct)
%genwave_expdamp - 给定该音的各项参数等生成对应音频数据，使用正弦音，返回的声音进行了指数衰减
%
%    [soundm,tmpstruct] = genwave_expdamp(strct,bdura,fs,tempstruct)
%
%    strct
%        包含该音各项信息的struct
%
%    bdura
%        每一拍实际时长
%
%    fs
%        每秒采样数
%
%    tempstruct
%        储存临时数据的结构体。在本函数中实际用不上。
%
%    返回：
%
%    soundm
%        声音数据的单行矩阵
%
%    tmpstruct
%        储存临时数据的结构体。

  [soundm,tempstruct]=sinwave.genwave(strct,bdura,fs,tempstruct);
  soundm=atte_m(soundm);
  tmpstruct=tempstruct;

  function output = atte_m(ori_m)
    att=20.^(linspace(0,strct.dura*bdura,fs*strct.dura*bdura).*(-1));
    output=ori_m.*att;
  end

end