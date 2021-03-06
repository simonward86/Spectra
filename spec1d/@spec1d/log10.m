function sout=log10(varargin)
%
% function r = log10(s1..sn)
%
% @SPEC1D/Log10 function to give the log of each spectrum s1...sn.
%
% Simon Ward 26/01/2016 - simon.ward@psi.ch
%

s1 = [varargin{:}];

for n = 1:length(s1)
    
    x = s1(n).x(:);
    y = s1(n).y(:);
    e = s1(n).e(:);
    yfit = s1(n).yfit(:);
    
    r = s1(n);
    r.x = x;
    r.y = log10(y);
    r.e = r.e./(log(10)*s1(n).y);
    
    if ~isempty(yfit)
        r.yfit = log10(yfit);
    end
    sout(n) = feval(class(r),r);
end