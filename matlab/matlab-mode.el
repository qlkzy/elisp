;; New Matlab Mode

(require 'button)




(defconst matlab-operators
  '("<" ">" "<=" ">=" "==" "~=" "&" "|" "~" "&&" "||" ":" "/" "\\" ))

(defconst matlab-brackets
  '("[" "]" "{" "}"))

(defconst matlab-keywords
  '("abs" "accumarray" "acos" "acosd" "acosh" "acot" "acotd" "acoth"
    "acsc" "acscd" "acsch" "actxcontrol" "actxcontrollist"
    "actxcontrolselect" "actxGetRunningServer" "actxserver" "addCause"
    "addevent" "addframe" "addlistener" "addOptional" "addParamValue"
    "addpath" "addpref" "addprop" "addproperty" "addRequired"
    "addsample" "addsampletocollection" "addtodate" "addts" "airy"
    "align" "alim" "all" "allchild" "alpha" "alphamap" "amd" "ancestor"
    "and" "angle" "annotation" "ans" "any" "area" "arrayfun" "ascii"
    "asec" "asecd" "asech" "asin" "asind" "asinh" "assert" "assignin"
    "atan" "atan2" "atand" "atanh" "audioplayer" "audiorecorder"
    "aufinfo" "auread" "auwrite" "avifile" "aviinfo" "aviread" "axes"
    "axis" "balance" "bar" "barh" "bar3" "bar3h" "base2dec" "beep"
    "bench" "besselh" "besseli" "besselj" "besselk" "bessely" "beta"
    "betainc" "betaln" "bicg" "bicgstab" "bin2dec" "binary" "bitand"
    "bitcmp" "bitget" "bitmax" "bitor" "bitset" "bitshift" "bitxor"
    "blanks" "blkdiag" "box" "break" "brighten" "brush" "bsxfun"
    "builddocsearchdb" "bvp4c" "bvp5c" "bvpget" "bvpinit" "bvpset"
    "bvpxtend" "calendar" "calllib" "callSoapService" "camdolly"
    "cameratoolbar" "camlight" "camlookat" "camorbit" "campan" "campos"
    "camproj" "camroll" "camtarget" "camup" "camva" "camzoom" "cart2pol"
    "cart2sph" "case" "cast" "cat" "catch" "caxis" "cd" "cd" "cdf2rdf"
    "cdfepoch" "cdfinfo" "cdfread" "cdfwrite" "ceil" "cell" "cell2mat"
    "cell2struct" "celldisp" "cellfun" "cellplot" "cellstr" "cgs" "char"
    "checkin" "checkout" "chol" "cholinc" "cholupdate" "circshift" "cla"
    "clabel" "class" "classdef" "clc" "clear" "clearvars" "clear" "clf"
    "clipboard" "clock" "close" "close" "close" "closereq" "cmopts"
    "colamd" "colorbar" "colordef" "colormap" "colormapeditor"
    "ColorSpec" "colperm" "comet" "comet3" "commandhistory"
    "commandwindow" "compan" "compass" "complex" "computer" "cond"
    "condeig" "condest" "coneplot" "conj" "continue" "contour"
    "contour3" "contourc" "contourf" "contourslice" "contrast" "conv"
    "conv2" "convhull" "convhulln" "convn" "copyfile" "copyobj"
    "corrcoef" "cos" "cosd" "cosh" "cot" "cotd" "coth" "cov" "cplxpair"
    "cputime" "create" "createClassFromWsdl" "createCopy"
    "createSoapMessage" "cross" "csc" "cscd" "csch" "csvread" "csvwrite"
    "ctranspose" "cumprod" "cumsum" "cumtrapz" "curl" "customverctrl"
    "cylinder" "daqread" "daspect" "datacursormode" "datatipinfo" "date"
    "datenum" "datestr" "datetick" "datevec" "dbclear" "dbcont" "dbdown"
    "dblquad" "dbmex" "dbquit" "dbstack" "dbstatus" "dbstep" "dbstop"
    "dbtype" "dbup" "dde23" "ddeget" "ddesd" "ddeset" "deal" "deblank"
    "debug" "dec2base" "dec2bin" "dec2hex" "decic" "deconv" "del2"
    "delaunay" "delaunay3" "delaunayn" "delete" "delete" "delete"
    "delete" "delete" "delete" "deleteproperty" "delevent" "delsample"
    "delsamplefromcollection" "demo" "depdir" "depfun" "det" "detrend"
    "detrend" "deval" "diag" "dialog" "diary" "diff" "diffuse" "dir"
    "dir" "disp" "disp" "disp" "disp" "disp" "display" "divergence"
    "dlmread" "dlmwrite" "dmperm" "doc" "docopt" "docsearch" "dos" "dot"
    "double" "dragrect" "drawnow" "dsearch" "dsearchn" "dynamicprops"
    "echo" "echodemo" "edit" "eig" "eigs" "ellipj" "ellipke" "ellipsoid"
    "else" "elseif" "enableservice" "end" "eomday" "eps" "eq" "eq" "erf"
    "erfc" "erfcx" "erfinv" "erfcinv" "error" "errorbar" "errordlg"
    "etime" "etree" "etreeplot" "eval" "evalc" "evalin"
    "event.EventData" "event.PropertyEvent" "event.listener"
    "event.proplistener" "eventlisteners" "events" "events" "Execute"
    "exifread" "exist" "exit" "exp" "expint" "expm" "expm1"
    "export2wsdlg" "eye" "ezcontour" "ezcontourf" "ezmesh" "ezmeshc"
    "ezplot" "ezplot3" "ezpolar" "ezsurf" "ezsurfc" "factor" "factorial"
    "false" "fclose" "fclose" "feather" "feof" "ferror" "feval" "Feval"
    "fft" "fft2" "fftn" "fftshift" "fftw" "fgetl" "fgetl" "fgets"
    "fgets" "fieldnames" "figure" "figurepalette" "fileattrib"
    "filebrowser" "filehandle" "filemarker" "fileparts" "fileread"
    "filesep" "fill" "fill3" "filter" "filter" "filter2" "find"
    "findall" "findfigs" "findobj" "findobj" "findprop" "findstr"
    "finish" "fitsinfo" "fitsread" "fix" "flipdim" "fliplr" "flipud"
    "floor" "flow" "fminbnd" "fminsearch" "fopen" "fopen" "for" "format"
    "fplot" "fprintf" "fprintf" "frame2im" "fread" "fread" "freqspace"
    "frewind" "fscanf" "fscanf" "fseek" "ftell" "ftp" "full" "fullfile"
    "func2str" "function" "function_handle" "functions" "funm" "fwrite"
    "fwrite" "fzero" "gallery" "gamma" "gammainc" "gammaln" "gca" "gcbf"
    "gcbo" "gcd" "gcf" "gco" "ge" "genpath" "genvarname" "get" "get"
    "get" "get" "get" "get" "get" "get" "get" "getabstime" "getabstime"
    "getappdata" "GetCharArray" "getdatasamplesize" "getDefaultStream"
    "getdisp" "getenv" "getfield" "getframe" "GetFullMatrix"
    "getinterpmethod" "getpixelposition" "getpref" "getqualitydesc"
    "getReport" "getsampleusingtime" "getsampleusingtime"
    "gettimeseriesnames" "gettsafteratevent" "gettsafterevent"
    "gettsatevent" "gettsbeforeatevent" "gettsbeforeevent"
    "gettsbetweenevents" "GetVariable" "GetWorkspaceData" "ginput"
    "global" "gmres" "gplot" "grabcode" "gradient" "graymon" "grid"
    "griddata" "griddata3" "griddatan" "gsvd" "gt" "gtext" "guidata"
    "guide" "guihandles" "gunzip" "gzip" "hadamard" "handle" "hankel"
    "hdf" "hdf5" "hdf5info" "hdf5read" "hdf5write" "hdfinfo" "hdfread"
    "hdftool" "help" "helpbrowser" "helpdesk" "helpdlg" "helpwin" "hess"
    "hex2dec" "hex2num" "hgexport" "hggroup" "hgload" "hgsave"
    "hgsetget" "hgtransform" "hidden" "hilb" "hist" "histc" "hold"
    "home" "horzcat" "horzcat" "hostid" "hsv2rgb" "hypot" "i"
    "idealfilter" "idivide" "if" "ifft" "ifft2" "ifftn" "ifftshift"
    "ilu" "im2frame" "im2java" "imag" "image" "imagesc" "imfinfo"
    "imformats" "import" "importdata" "imread" "imwrite" "ind2rgb"
    "ind2sub" "Inf" "inferiorto" "info" "inline" "inmem" "inpolygon"
    "input" "inputdlg" "inputname" "inputParser" "inspect"
    "instrcallback" "instrfind" "instrfindall" "int2str" "int8" "int16"
    "int32" "int64" "interfaces" "interp1" "interp1q" "interp2"
    "interp3" "interpft" "interpn" "interpstreamspeed" "intersect"
    "intmax" "intmin" "intwarning" "inv" "invhilb" "invoke" "ipermute"
    "iqr" "is*" "isa" "isappdata" "iscell" "iscellstr" "ischar" "iscom"
    "isdir" "isempty" "isempty" "isempty" "isequal" "isequal"
    "isequalwithequalnans" "isevent" "isfield" "isfinite" "isfloat"
    "isglobal" "ishandle" "ishold" "isinf" "isinteger" "isinterface"
    "isjava" "isKey" "iskeyword" "isletter" "islogical" "ismac"
    "ismember" "ismethod" "isnan" "isnumeric" "isobject" "isocaps"
    "isocolors" "isonormals" "isosurface" "ispc" "ispref" "isprime"
    "isprop" "isreal" "isscalar" "issorted" "isspace" "issparse" "isstr"
    "isstrprop" "isstruct" "isstudent" "isunix" "isvalid" "isvalid"
    "isvalid" "isvarname" "isvector" "j" "javaaddpath" "javaArray"
    "javachk" "javaclasspath" "javaMethod" "javaObject" "javarmpath"
    "keyboard" "keys" "kron" "last" "lasterr" "lasterror" "lastwarn"
    "lcm" "ldl" "ldivide" "rdivide" "le" "legend" "legendre" "length"
    "length" "length" "length" "length" "libfunctions"
    "libfunctionsview" "libisloaded" "libpointer" "libstruct" "license"
    "light" "lightangle" "lighting" "lin2mu" "line" "LineSpec"
    "linkaxes" "linkdata" "linkprop" "linsolve" "linspace" "list"
    "listdlg" "listfonts" "load" "load" "load" "loadlibrary" "loadobj"
    "log" "log10" "log1p" "log2" "logical" "loglog" "logm" "logspace"
    "lookfor" "lower" "ls" "lscov" "lsqnonneg" "lsqr" "lt" "lu" "luinc"
    "magic" "makehgtform" "containers.Map" "mat2cell" "mat2str"
    "material" "matlabcolon" "matlabrc" "matlabroot" "matlab" "matlab"
    "max" "max" "MaximizeCommandWindow" "maxNumCompThreads" "mean"
    "mean" "median" "median" "memmapfile" "memory" "menu" "mesh" "meshc"
    "meshz" "meshgrid" "meta.class" "meta.class.fromName"
    "meta.DynamicProperty" "meta.event" "meta.method" "meta.package"
    "meta.package.fromName" "meta.package.getAllPackages"
    "meta.property" "metaclass" "methods" "methodsview" "mex"
    "mex.getCompilerConfigurations" "MException" "mexext" "mfilename"
    "mget" "min" "min" "MinimizeCommandWindow" "minres" "mislocked"
    "mkdir" "mkdir" "mkpp" "mldivide" "mrdivide" "mlint" "mlintrpt"
    "mlock" "mmfileinfo" "mmreader" "mod" "mode" "more" "move"
    "movefile" "movegui" "movie" "movie2avi" "mput" "msgbox" "mtimes"
    "mu2lin" "multibandread" "multibandwrite" "munlock" "namelengthmax"
    "NaN" "nargchk" "nargin" "nargout" "nargoutchk" "native2unicode"
    "nchoosek" "ndgrid" "ndims" "ne" "ne" "netcdf" "netcdf.abort"
    "netcdf.close" "netcdf.copyAtt" "netcdf.create" "netcdf.defDim"
    "netcdf.defVar" "netcdf.delAtt" "netcdf.endDef" "netcdf.getAtt"
    "netcdf.getConstant" "netcdf.getConstantNames" "netcdf.getVar"
    "netcdf.inq" "netcdf.inqAtt" "netcdf.inqAttID" "netcdf.inqAttName"
    "netcdf.inqDim" "netcdf.inqDimID" "netcdf.inqLibVers"
    "netcdf.inqVar" "netcdf.inqVarID" "netcdf.open" "netcdf.putAtt"
    "netcdf.putVar" "netcdf.reDef" "netcdf.renameAtt" "netcdf.renameDim"
    "netcdf.renameVar" "netcdf.setDefaultFormat" "netcdf.setFill"
    "netcdf.sync" "newplot" "nextpow2" "nnz" "noanimate" "nonzeros"
    "norm" "normest" "not" "notebook" "notify" "now" "nthroot" "null"
    "num2cell" "num2hex" "num2str" "numel" "nzmax" "ode15i" "ode23"
    "ode45" "ode113" "ode15s" "ode23s" "ode23t" "ode23tb" "odefile"
    "odeget" "odeset" "odextend" "onCleanup" "ones" "open" "openfig"
    "opengl" "openvar" "optimget" "optimset" "or" "ordeig" "orderfields"
    "ordqz" "ordschur" "orient" "orth" "otherwise" "pack" "padecoef"
    "pagesetupdlg" "pan" "pareto" "parfor" "parse" "parseSoapResponse"
    "partialpath" "pascal" "patch" "path" "path2rc" "pathsep" "pathtool"
    "pause" "pbaspect" "pcg" "pchip" "pcode" "pcolor" "pdepe" "pdeval"
    "peaks" "perl" "perms" "permute" "persistent" "pi" "pie" "pie3"
    "pinv" "planerot" "playshow" "plot" "plot" "plot3" "plotbrowser"
    "plotedit" "plotmatrix" "plottools" "plotyy" "pol2cart" "polar"
    "poly" "polyarea" "polyder" "polyeig" "polyfit" "polyint" "polyval"
    "polyvalm" "pow2" "power" "ppval" "prefdir" "preferences" "primes"
    "print" "printopt" "printdlg" "printpreview" "prod" "profile"
    "profsave" "propedit" "propedit" "properties" "propertyeditor" "psi"
    "publish" "PutCharArray" "PutFullMatrix" "PutWorkspaceData" "pwd"
    "qmr" "qr" "qrdelete" "qrinsert" "qrupdate" "quad" "quadgk" "quadl"
    "quadv" "questdlg" "quit" "Quit" "quiver" "quiver3" "qz" "rand"
    "rand" "randi" "randi" "randn" "randn" "randperm" "randperm"
    "RandStream" "RandStream" "rank" "rat" "rats" "rbbox" "rcond" "read"
    "readasync" "real" "reallog" "realmax" "realmin" "realpow"
    "realsqrt" "record" "rectangle" "rectint" "recycle" "reducepatch"
    "reducevolume" "refresh" "refreshdata" "regexp" "regexpi"
    "regexprep" "regexptranslate" "registerevent" "rehash" "release"
    "relationaloperators" "rem" "remove" "removets" "rename" "repmat"
    "resample" "resample" "reset" "reset" "reshape" "residue"
    "restoredefaultpath" "rethrow" "rethrow" "return" "rgb2hsv"
    "rgbplot" "ribbon" "rmappdata" "rmdir" "rmdir" "rmfield" "rmpath"
    "rmpref" "roots" "rose" "rosser" "rot90" "rotate" "rotate3d" "round"
    "rref" "rsf2csf" "run" "save" "save" "save" "saveas" "saveobj"
    "savepath" "scatter" "scatter3" "schur" "script" "sec" "secd" "sech"
    "selectmoveresize" "semilogx" "semilogy" "sendmail" "serial"
    "serialbreak" "set" "set" "set" "set" "set" "set" "set" "set"
    "setabstime" "setabstime" "setappdata" "setDefaultStream" "setdiff"
    "setdisp" "setenv" "setfield" "setinterpmethod" "setpixelposition"
    "setpref" "setstr" "settimeseriesnames" "setxor" "shading" "shg"
    "shiftdim" "showplottool" "shrinkfaces" "sign" "sin" "sind" "single"
    "sinh" "size" "size" "size" "size" "size" "slice" "smooth3"
    "snapnow" "sort" "sortrows" "sound" "soundsc" "spalloc" "sparse"
    "spaugment" "spconvert" "spdiags" "specular" "speye" "spfun"
    "sph2cart" "sphere" "spinmap" "spline" "spones" "spparms" "sprand"
    "sprandn" "sprandsym" "sprank" "sprintf" "spy" "sqrt" "sqrtm"
    "squeeze" "ss2tf" "sscanf" "stairs" "start" "startat" "startup"
    "std" "std" "stem" "stem3" "stop" "stopasync" "str2double"
    "str2func" "str2mat" "str2num" "strcat" "strcmp" "strcmpi" "stream2"
    "stream3" "streamline" "streamparticles" "streamribbon"
    "streamslice" "streamtube" "strfind" "strings" "strjust" "strmatch"
    "strncmp" "strncmpi" "strread" "strrep" "strtok" "strtrim" "struct"
    "struct2cell" "structfun" "strvcat" "sub2ind" "subplot" "subsasgn"
    "subsindex" "subspace" "subsref" "substruct" "subvolume" "sum" "sum"
    "superiorto" "support" "surf" "surfc" "surf2patch" "surface" "surfl"
    "surfnorm" "svd" "svds" "swapbytes" "switch" "symamd" "symbfact"
    "symmlq" "symrcm" "symvar" "synchronize" "syntax" "system" "tan"
    "tand" "tanh" "tar" "tempdir" "tempname" "tetramesh" "texlabel"
    "text" "textread" "textscan" "textwrap" "throw" "throwAsCaller"
    "tic" "toc" "timer" "timerfind" "timerfindall" "timeseries" "title"
    "todatenum" "toeplitz" "toolboxdir" "trace" "transpose" "trapz"
    "treelayout" "treeplot" "tril" "trimesh" "triplequad" "triplot"
    "trisurf" "triu" "true" "try" "tscollection" "tsdata.event"
    "tsearch" "tsearchn" "tsprops" "tstool" "type" "typecast"
    "uibuttongroup" "uicontextmenu" "uicontrol" "uigetdir" "uigetfile"
    "uigetpref" "uiimport" "uimenu" "uint8" "uint16" "uint32" "uint64"
    "uiopen" "uipanel" "uipushtool" "uiputfile" "uiresume" "uisave"
    "uisetcolor" "uisetfont" "uisetpref" "uistack" "uitable"
    "uitoggletool" "uitoolbar" "uiwait" "undocheckout" "unicode2native"
    "union" "unique" "unix" "unloadlibrary" "unmkpp"
    "unregisterallevents" "unregisterevent" "untar" "unwrap" "unzip"
    "upper" "urlread" "urlwrite" "usejava" "userpath"
    "validateattributes" "validatestring" "values" "vander" "var" "var"
    "varargin" "varargout" "vectorize" "ver" "verctrl" "verLessThan"
    "version" "vertcat" "vertcat" "vertcat" "view" "viewmtx" "visdiff"
    "volumebounds" "voronoi" "voronoin" "wait" "waitbar" "waitfor"
    "waitforbuttonpress" "warndlg" "warning" "waterfall" "wavfinfo"
    "wavplay" "wavread" "wavrecord" "wavwrite" "web" "weekday" "what"
    "whatsnew" "which" "while" "whitebg" "who" "whos" "wilkinson"
    "winopen" "winqueryreg" "wk1finfo" "wk1read" "wk1write" "workspace"
    "xlabel" "ylabel" "zlabel" "xlim" "ylim" "zlim" "xlsfinfo" "xlsread"
    "xlswrite" "xmlread" "xmlwrite" "xor" "xslt" "zeros" "zip" "zoom"))

(defconst matlab-indent-keywords
  '("classdef" "function" "for" "while" "if" "else" "elseif"
    "events" "properties" "methods" "case" "otherwise" "try"
    "catch"))

(defconst matlab-indent-keywords-regex
  (concat "^[[:space:]]*" (regexp-opt matlab-indent-keywords 'words)))

(defconst matlab-outdent-keywords
  '("end" "else" "elseif" "case" "otherwise" "catch"))

(defconst matlab-outdent-keywords-regex
  (concat "^[[:space:]]*" (regexp-opt matlab-outdent-keywords 'words)))

(defconst matlab-function-name-regexes
  '("^[[:space:]]*classdef[[:space:]]+\\([[:word:]_]+\\)"
    "^[[:space:]]*function.*[[:space:]]\\([[:word:]_]+\\)[[:space:]]*[(\n]"))



(defvar matlab-indentation-level
  4)



;;; Indentation

(defun matlab-back-to-text ()
  "Go back to the last line before this one with text on it"
  (forward-line -1)
  (if (or
       (and (string-match "^[[:space:]]*$"
                          (buffer-substring (line-beginning-position)
                                            (line-end-position)))
            (not (bobp)))
       (matlab-previous-unclosed-paren-col))
      (matlab-back-to-text)))

(defun matlab-previous-indentation ()
  "Get the indentation of the previous line"
  (save-excursion
    (matlab-back-to-text)
    (current-indentation)))

(defun matlab-does-previous-indent ()
  "Check if the previous line should cause subsequent lines to be
indented further"
  (if (save-excursion
        (beginning-of-line)
        (bobp))
      nil
    (let (stat)
      (save-excursion
        (matlab-back-to-text)
        (setq stat 
              (string-match matlab-indent-keywords-regex
                            (buffer-substring 
                             (line-beginning-position) 
                             (line-end-position)))))
      stat)))

(defun matlab-does-current-outdent ()
  "Check if the current line should cause itself to be outdented"
  (string-match matlab-outdent-keywords-regex
                (buffer-substring 
                 (line-beginning-position)
                 (line-end-position))))

(defun matlab-adjust-indentation (target)
  "Inserts whitespace at the beginning of the current line until the
first nonblank character is at column TARGET"
  (save-excursion
    (indent-line-to target)))

(defun matlab-previous-unclosed-paren-col ()
  (let ((last-paren (cadr 
                     (save-excursion
                       (syntax-ppss (line-beginning-position))))))
    (if last-paren
        (save-excursion
          (goto-char last-paren)
          (- last-paren (line-beginning-position)))
      nil)))
      
(defun matlab-indent-function ()
  (let ((unclosed (matlab-previous-unclosed-paren-col)))
    (cond
     (unclosed
      (matlab-adjust-indentation 
       (+ unclosed 1)))
     ((matlab-does-current-outdent)
      (matlab-adjust-indentation
       (let ((sugg (- (matlab-previous-indentation)
                      matlab-indentation-level)))
         (cond ((matlab-does-previous-indent)
                (matlab-previous-indentation))
         ((< 0 sugg) sugg)
         (t 0)))))
     ((matlab-does-previous-indent)
      (matlab-adjust-indentation
       (+ (matlab-previous-indentation)
          matlab-indentation-level)))
     (t
      (matlab-adjust-indentation
       (matlab-previous-indentation))))
    (if (bolp)
        (back-to-indentation))))




;;; Font Lock

;; (defun matlab-make-keyword-regex (strings)
;;   (concat "\\(?:^\\|[^_]\\)"
;;           "\\("
;;           "\\<"
;;           (regexp-opt strings 'words) 
;;           "\\>"
;;           "\\)"
;;           "\\(?:[^_]\\|$\\)"))

(defun matlab-make-keyword-regex (strings)
  (concat "\\_<" (regexp-opt strings 'words) "\\_>"))

(defun matlab-make-operator-regex (strings)
  (regexp-opt strings))

(defun matlab-make-font-keywords (strings face)
  (list (cons (matlab-make-keyword-regex strings)
              face)))

(defun matlab-make-font-brackets (strings face)
  (list (cons (matlab-make-operator-regex strings)
              face)))

(defun matlab-make-font-operators (strings face)
  (list (cons (matlab-make-operator-regex strings)
              face)))

(defun matlab-make-font-function-name (regexes face)
  (let (result (list nil))
    (dolist (elt regexes result)
      (setq result (append result
                           (list (cons elt (list 1 face t))))))
    result))

(defun matlab-make-font-lock-regexes ()
  (append (matlab-make-font-keywords matlab-keywords
                                     font-lock-keyword-face)
          (matlab-make-font-operators matlab-operators
                                      font-lock-builtin-face)
          (matlab-make-font-brackets matlab-brackets
                                     font-lock-constant-face)
          (matlab-make-font-function-name matlab-function-name-regexes
                                        font-lock-function-name-face)))



;;; Abbrevs

(defun matlab-abbrevs-valid ()
  (let ((syn-state (save-excursion 
                    (syntax-ppss (point)))))
    (not (or (nth 3 syn-state)
             (nth 4 syn-state)))))

(defun matlab-pre-abbrev-expand-hook ()
  (if (matlab-abbrevs-valid)
      (setq local-abbrev-table matlab-mode-abbrev-table)
    (setq local-abbrev-table nil)))



;;; Skeletons

(define-skeleton matlab-header-1
  "Insert a large comment header" nil
  > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n
  > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n
  > "%%%%    "-""\n
  > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n
  > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n)

(define-skeleton matlab-header-2
  "Insert a medium comment header" nil
  > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n
  > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n
  > "%%  "-""\n
  > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n
  > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n)

(define-skeleton matlab-header-3
  "Insert a small comment header" nil
  > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n
  > "% "-""\n
  > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n)

(define-skeleton matlab-if-end
  "Insert an if...end construct" nil
  > "if ("-")"\n
  >  \n
  > -4 "end"\n)

(define-skeleton matlab-short-single-sidebar
  "Insert a column of comment characters" nil
  > "% " - \n
  > "% " \n
  > "% " \n)

(define-skeleton matlab-long-single-sidebar
  "Insert a long column of comment characters" nil
    > "% " - \n
    > "% " \n
    > "% " \n
    > "% " \n
    > "% " \n
    > "% " \n
    > "% " \n
    > "% " \n)

(define-skeleton matlab-short-double-sidebar
  "Insert a column of comment characters" nil
  > "%%  " - \n
  > "%%  " \n
  > "%%  " \n)

(define-skeleton matlab-long-double-sidebar
  "Insert a long column of comment characters" nil
    > "%%  " - \n
    > "%%  " \n
    > "%%  " \n
    > "%%  " \n
    > "%%  " \n
    > "%%  " \n
    > "%%  " \n
    > "%%  " \n)

(define-skeleton matlab-for-end
  "Insert a for...end loop" nil
  > "for "-""\n
  >  \n
  > -4 "end"\n)

(define-skeleton matlab-while-end
  "Insert a while...end loop" nil
  > "while ("-")"\n
  >  \n
  > -4 "end"\n)

(define-skeleton matlab-elseif
  "Insert an elseif" nil
  > -4 "elseif ("-")"\n)

(define-skeleton matlab-display
  "Insert a display('') statement" nil
  > "display ('"-"');"\n)

(define-skeleton matlab-string-to-double-closed
  "Insert a str2double() statement" nil
  > "str2double("-")")

(define-skeleton matlab-string-to-double-open
  "Insert a str2double( statement" nil
  > "str2double("-)

(define-skeleton matlab-function
  "Insert a function = ... statement" nil
  > "function "-" =  ()")

(define-skeleton matlab-classdef
  "Insert a classdef... statement" nil
  > "classdef "- \n \n
  > "properties" \n \n
  > "end" \n \n \n
  > "events" \n \n
  > "end" \n \n \n
  > "methods" \n \n
  > "end" \n \n \n
  > "methods (Access = private)" \n \n
  > "end" \n \n
  > -4 "end" \n)



;;; Mode Functions


;;;; M-Lint

(defun matlab-mlint-buffer ()
  (interactive)
  (save-buffer)
  (let ((file (buffer-file-name))
        (m-lint-buffer (get-buffer-create "**M-Lint Output**")))
    (pop-to-buffer m-lint-buffer)
    (set (make-local-variable 'buffer-read-only) nil)
    (erase-buffer)
    (insert
     (concat
      file
      ":\n\n"
      (shell-command-to-string 
       (concat "mlint " (shell-quote-argument file)))))
    (set (make-local-variable 'buffer-read-only) t)
    (matlab-mlint-linkify-buffer)))

(defun matlab-mlint-get-pos ()
  (let ((str (buffer-substring (line-beginning-position)
                              (line-end-position)))
        (result))
    (if (string-match
         "L\\ +\\([0-9]+\\)\\ +(C\\ \\([0-9]+\\)" str)
        (let ((line (match-string 1 str))
              (col (match-string 2 str)))
          (list (string-to-number line) 
                (string-to-number col)))
      nil)))

(defun matlab-mlint-show-pos ()
  (interactive)
  (message (matlab-mlint-get-pos)))

(defun matlab-mlint-get-original-buffer ()
  (save-excursion
    (goto-line 1)
    (find-buffer-visiting
     (buffer-substring (line-beginning-position)
                       (- (line-end-position) 1)))))

(defun matlab-mlint-goto-original-buffer ()
  (pop-to-buffer (matlab-mlint-get-original-buffer)))

(defun matlab-goto-row-col-pos (line col)
  (goto-line line)
  (beginning-of-line)
  (forward-char (- col 1)))

(defun matlab-mlint-goto-error-source ()
  (interactive)
  (let ((pos (matlab-mlint-get-pos)))
    (matlab-mlint-goto-original-buffer)
    (if pos
        (matlab-goto-row-col-pos (car pos)
                                 (cadr pos)))))

(defun matlab-mlint-linkify-buffer ()
  (save-excursion
    (beginning-of-buffer)
    (dotimes (i (count-lines (point-min) (point-max)))
      (make-button (line-beginning-position) (line-end-position)
                   'action (lambda (x) (matlab-mlint-goto-error-source))
                   'follow-link t)
      (forward-line 1))))


;;;; Comment Headers

(defun matlab-insert-comment-header (arg)
  (interactive "P")
  (if (and arg (numberp arg))
      (cond
       ((= arg 1) (matlab-header-1))
       ((= arg 2) (matlab-header-2))
       (t (matlab-header-3)))
    (matlab-header-3)))





;;; Setup functions

;;;; Syntax Table

(defun matlab-setup-syntax-table ()
  (modify-syntax-entry ?\% "<" matlab-mode-syntax-table)
  (modify-syntax-entry ?\n ">" matlab-mode-syntax-table)
  (modify-syntax-entry ?\' "\"" matlab-mode-syntax-table)
  (modify-syntax-entry ?\_ "_" matlab-mode-syntax-table)
  (modify-syntax-entry ?\- "." matlab-mode-syntax-table)
  (modify-syntax-entry ?\\ "." matlab-mode-syntax-table))

;;;; Newcomment

(defun matlab-setup-newcomment ()
  (if (boundp 'comment-start)
      (set (make-local-variable 'comment-start) "%"))
  (if (boundp 'comment-end)
      (set (make-local-variable 'comment-end) "")))


;;;; Indentation

(defun matlab-setup-indentation ()
  (set (make-local-variable 'indent-line-function)
       'matlab-indent-function)
  (set (make-local-variable 'indent-region-function)
       nil))


;;;; Font Lock

(defun matlab-setup-font-lock ()
  (set (make-local-variable 'font-lock-defaults)
       (list (matlab-make-font-lock-regexes))))

;;;; Hide-Show

(defun matlab-setup-hide-show ()
  nil)

;;;; Skeletons

(defun matlab-setup-skeletons ()
  (abbrev-def-list matlab-mode-abbrev-table
    ("bigcommhead" "" 'matlab-header-1)
    ("medcommhead" "" 'matlab-header-2)
    ("mincommhead" "" 'matlab-header-3)
    ("commss" "" 'matlab-short-single-sidebar)
    ("commsl" "" 'matlab-long-single-sidebar)
    ("commds" "" 'matlab-short-double-sidebar)
    ("commdl" "" 'matlab-long-double-sidebar)
    ("if" "" 'matlab-if-end)
    ("for" "" 'matlab-for-end)
    ("while" "" 'matlab-while-end)
    ("elseif" "" 'matlab-elseif)
    ("function" "" 'matlab-function)
    ("display" "" 'matlab-display)
    ("s2dc" "" 'matlab-string-to-double-closed)
    ("s2do" "str2double(" nil)
    ("classdef" "" 'matlab-classdef)))



;;; Abbrevs

(defun matlab-setup-abbrevs ()
  (abbrev-def-list matlab-mode-abbrev-table
    ("end" "end" 'matlab-indent-function)
    ("else" "else" 'matlab-indent-function))
  (abbrev-mode t)
  (add-hook (make-local-variable 'pre-abbrev-expand-hook)
            'matlab-pre-abbrev-expand-hook))



;;; Keymap




;;; Keybindings

(defun matlab-setup-keybindings ()
  (define-key matlab-mode-map (kbd "RET") 'newline-and-indent)
  (define-key matlab-mode-map (kbd "C-c C-c") 'matlab-mlint-buffer)
  (fset (make-local-variable 'insert-comment-header) 'matlab-insert-comment-header))



(define-derived-mode matlab-mode fundamental-mode "Matlab"
  "Major mode for editing MATLAB source code files"
  (matlab-setup-font-lock)
  (matlab-setup-indentation)
  (matlab-setup-skeletons)
  (matlab-setup-abbrevs)
  (matlab-setup-keybindings)
  (matlab-setup-syntax-table)
  (matlab-setup-newcomment)
  (matlab-setup-hide-show))
