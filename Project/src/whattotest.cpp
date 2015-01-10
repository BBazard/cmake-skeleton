#include <math.h>
 
double squareRoot(const double a) {
    double b = sqrt(a);
    if(b != b) { // nan check
        return -1.0;
    }else{
        return sqrt(a);
    }
}

class maclass {

  public :

   maclass() : bla(5)
   {}

   int getbla() {
     return bla;
   }

  int bla;
};
