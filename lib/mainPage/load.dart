import 'package:cloud_firestore/cloud_firestore.dart';
import 'mainpage_module.dart';

class Load{

  Future<List<mainTypes>> getData() async{
    final fire = FirebaseFirestore.instance.collection('Category');
    final re = await fire.get();
    List res = re.docs.map((doc) => doc.data()).toList();
    List<mainTypes> pr = [];
    for(int i=0; i<res.length; i++){
      pr.add(mainTypes.fromJson(res[i]));
    }
    return pr;
  }

}