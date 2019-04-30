function soundmatrix = str2sound(snmnstr,func,bdura,fs)
%str2sound - 直接从snmn格式字符串转换出音频信号矩阵，需给定单音生成函数等
%
%    soundmatrix = str2sound(str)
%
%    snmnstr
%       给定的snmn格式字符串。
%
%    func
%        生成单音的函数。该函数的前四个参数应为表示一个音的struct、一拍以秒为单
%        位的实际时长、每秒采样数和一个储存临时数据的结构体，返回生成的声音信号
%        单行矩阵和一个储存临时数据的结构体。
%
%    bdura
%        一拍以秒为单位的实际时长，将作为参数传递给func。
%
%    fs
%        每秒采样数。
%
%    返回生成的音频信号单行矩阵。

  soundmatrix=[];
  aft=0; % prefix:1,suffix:2,note:3
  note=0;
  lorh=0; % ...,-1,0,1,...
  half=0;
  dura=1;
  doendcreate=1;
  tempstruct=struct('new',1);
  for c=char(snmnstr)

    if(strcmp(c,"0"))
      checkpre_note();
      aft=3;note=0;
    elseif(strcmp(c,"1"))
      checkpre_note();
      aft=3;note=1;
    elseif(strcmp(c,"2"))
      checkpre_note();
      aft=3;note=2;
    elseif(strcmp(c,"3"))
      checkpre_note();
      aft=3;note=3;
    elseif(strcmp(c,"4"))
      checkpre_note();
      aft=3;note=4;
    elseif(strcmp(c,"5"))
      checkpre_note();
      aft=3;note=5;
    elseif(strcmp(c,"6"))
      checkpre_note();
      aft=3;note=6;
    elseif(strcmp(c,"7"))
      checkpre_note();
      aft=3;note=7;
    elseif(strcmp(c,"-"))
      checkpre_pfx();
      aft=1;lorh=lorh-1;
    elseif(strcmp(c,"+"))
      checkpre_pfx();
      aft=1;lorh=lorh+1;
    elseif(strcmp(c,"#"))
      checkpre_pfx();
      aft=1;lorh=lorh+1;
    elseif(strcmp(c,"b"))
      checkpre_pfx();
      aft=1;lorh=lorh+1;
    elseif(strcmp(c,"~"))
      checkpre_sfx();
      aft=2;dura=dura+1;
    elseif(strcmp(c,"_"))
      checkpre_sfx();
      aft=2;dura=dura/2;
    elseif(strcmp(c,"."))
      checkpre_sfx();
      aft=2;dura=dura*1.5;
    elseif(strcmp(c,"%"))
      checkpre_end();
      break;
    end
  
  end

  if(doendcreate)
    create();
  end
  
  function checkpre_pfx
    if(aft==2)
      create();
    elseif(aft==3)
      create();
    end
  end
  
  function checkpre_sfx
    if(aft==1)
      error("you set a suffix after a prefix");
    end
  end
  
  function checkpre_note
    if(aft==2)
      create();
    elseif(aft==3)
      create();
    end
  end

  function checkpre_end
    if(aft==1)
      doendcreate=0;
    end
  end
  
  function create
    [sm,tempstruct]=func(snmn.createstruct(note,lorh,half,dura),bdura,fs,tempstruct);
    soundmatrix=[soundmatrix,sm];
    note=0; lorh=0; half=0; dura=1;
  end

end