use </Users/sebastianestevez/Downloads/allura/Allura-Regular.ttf>
t="MarianaEstevez";


//These fudge factors make it so that the underline is the right length
//for different words. Note, fudge factors are font specific
mSearchArray=search("M",t,0);
fudgeFactor=len(mSearchArray[0]);


bSearchArray=search("B",t,0);
fudge= fudgeFactor + len(bSearchArray[0])/6;

mlSearchArray=search("m",t,0);
fudge2= fudge + len(mlSearchArray[0])/3;

alSearchArray=search("a",t,0);
fudge3= fudge2 + len(alSearchArray[0])/6;

uSearchArray=search("u",t,0);
fudge4= fudge3 + len(uSearchArray[0])/6;

iSearchArray=search("i",t,0);
fudge5= fudge4 - len(iSearchArray[0])/4;


nSearchArray=search("n",t,0);
fudge6= fudge5 + len(nSearchArray[0])/6;

gSearchArray=search("G",t,0);
fudge7= fudge6 + len(gSearchArray[0])/6;


hSearchArray=search("H",t,0);
fudge8= fudge7 + len(hSearchArray[0])/6;


tSearchArray=search("t",t,0);
fudge9= fudge8 - len(tSearchArray[0])/6;


wSearchArray=search("W",t,0);
fudge10= fudge9 + len(wSearchArray[0]);


aSearchArray=search("A",t,0);
fudge11= fudge10 + len(aSearchArray[0])/3;


echo(fudge11);


size=10;
height= size / 15;
radius=height / 2;
spacing=.92;
length= len(t)*.47*size+len(t)*.08*size*fudge11;


$fn=20;
minkowski(){
linear_extrude(height = height)
    text(t, size = size, font = "Allura", spacing=spacing);
scale([1,1,1.5])
    sphere(r=radius, center=true);
}

//Underline (helps keep letters together when coming off the print bed
//and it doesn't look bad.
translate([.7,-.8,-.5])
    linear_extrude(height=2)
    square(size=[length,.4]);
