class Scenarios {
  
  int index;
  PVector GOOD_AND_CHEAP_BUT_NOT_FAST = new PVector( 1.0, 1.0, 0.0);
  PVector GOOD_AND_FAST_BUT_NOT_CHEAP = new PVector( 1.0, 0.0, 1.0);
  PVector CHEAP_AND_FAST_BUT_NOT_GOOD = new PVector( 0.0, 1.0, 1.0);
  
  PVector[] scenarios = {
    GOOD_AND_CHEAP_BUT_NOT_FAST,
    GOOD_AND_FAST_BUT_NOT_CHEAP,
    CHEAP_AND_FAST_BUT_NOT_GOOD
  };
  
  Scenarios() {
    index = 0;
  }

  Scenarios next() {
    index = (++index) % scenarios.length;
    return this;
  }  

  Scenarios previous() {
    index = (--index + scenarios.length) % scenarios.length;
    return this;
  }  
  
  PVector getScenario() {
    return scenarios[ index];
  }  
}
