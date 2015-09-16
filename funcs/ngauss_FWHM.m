function [y, name, pnames, pin]=ngauss(x,p, flag)
% ngauss    : N gaussians
% [y, {name, pnames, pin}]=ngauss(x,p, {flag})
% 
% MFIT N gaussians fitting function
% p = [ Amp1 Centre1 Width1 ... AmpN CentreN WidthN Background]


% Author:  EF <manuf@ldv.univ-montp2.fr>, MZ <mzinkin@sghms.ac.uk>
% Description:  N gaussians

%global ngss; 
ngss = (length(p)-1)/3;
if nargin==2
    y=zeros(size(x));
    for i=1:ngss
        off=3*(i-1);
        p(3+off)=p(3+off)/(2*sqrt(2*log(2)));
        y=y+p(1+off)*(1/(p(3+off)*sqrt(2*pi)))*exp(-0.5*(((x-p(2+off))/p(3+off)).^2));
    end;
    y=y+p(4+off)+p(5+off)*x+p(6+off)*x.^2;

else
   name=' N Gaussians';
   pin = p;
   y=zeros(size(x));
   if flag==2
   	ngss=0;

      	mf_msg('Click on background');    
	[x bg]=ginput(1);

	but=1;
	pin=[];
		
	while but==1
		mf_msg(sprintf('Click on peak %d (right button to end)',ngss+1));
		[cen amp but]=ginput(1);
		if but==1
			mf_msg(sprintf('Click on width %d (right button to end)',ngss+1));
			[width y but]=ginput(1);
			width=abs(width-cen);
			amp=amp-bg;
			pin=[pin amp cen width];
			ngss=ngss+1;
		end
	end
	pin=[ pin bg];
   end

   y=[];
   pnames={'Int_1','Centre_1','FWHM_1'};
   if ngss>0 & any(p)
	name=sprintf('%d Gaussians',ngss);
   else
	name='n gauss  : clik on Guess button to set n.';
	if flag==1, pin=[ 0 0 1 0 ]; else pin = p; end
   end

   for i=2:ngss
	pnames={pnames{:},...
               sprintf('Int_%d',i),...
               sprintf('Centre_%d',i),...
               sprintf('FWHM_%d ',i)};
   end;
   pnames={pnames{:},'Background','Background (x)','Background (x^2)'};
	
end
