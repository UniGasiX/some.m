function txt = readtxt(name)
%txt = readtxt(name) 
%
%    将指定文件中的内容作为文本读出（除去换行）。
%
%    name
%        指定的文件路径。
%    
%    以字符串返回读取出的文本（除去换行）。

  f = fopen(name);
  tmp = textscan(f, "%s", "Whitespace", "");
  tmp = tmp{1};
  txt = ""; text = "";
  for str = tmp
    text = strvcat(text, str);
  end
  for i = 1:size(text, 1)
    txt = strcat(txt, text(i, :));
  end
  fclose(f);

end

