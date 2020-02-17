import 'dart:async';
import 'dart:html';

class Cake{}
class Order{
  String type;
  Order(this.type);
}

void doMain() {
  final cont=StreamController();
  final order=new Order("zzz");
  cont.sink.add(order);
  final tras =StreamTransformer.fromHandlers(handleData:(c,s){
    if(c=='zz')
      s.add(Cake());
    else
      s.addError("No");
  });

  cont.stream.map(( ord)=>ord.type).transform(tras).listen((o){
    print(o);

  },onError:(s){print(s);});
}

void inHTML(){
// in HTML  write  =>  <button>ppp</button>
  final ButtonElement buttonElement = querySelector('button');

  void domain(){

    buttonElement.onClick.timeout(Duration(seconds: 1), onTimeout: (s) {
      s.addError("lost");
    }).listen((s){},onError: (e)=>print(e)
    );

  }
}