import  'package:flutter/material.dart';

import  'package:flutter/material.dart';

class ExpansionTileSample extends StatefulWidget {
  @override
  _ExpansionTileSampleState createState() => new _ExpansionTileSampleState();
}
 
class _ExpansionTileSampleState extends State<ExpansionTileSample> {
  @override
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
       home: new Scaffold(
         appBar: new AppBar(
           title: const Text('ExpansionTile'),
         ),
         body:new ListView.builder(
           itemBuilder: (BuildContext context, int index)=> new EntryItem(data[index]),
           itemCount: data.length,
         )
       ),
    );
  }
}

 class Entry{
   Entry(this.title,[this.children = const <Entry>[]]);
   final String title;
   final List<Entry> children;
 }

 final List<Entry> data = <Entry>[
   new Entry('Chapter A',
   <Entry>[
     new Entry('section A0',
     <Entry>[
       new Entry('item A0.1'),
       new Entry('item A0.2'),
       new Entry('item A0.3'),
       new Entry('item A0.4')
     ])
   ]),
   new Entry('Chapter B',
   <Entry>[
     new Entry('section B0',
     <Entry>[
       new Entry('item B0.1'),
       new Entry('item B0.2'),
       new Entry('item B0.3'),
       new Entry('item B0.4')
     ]),
     new Entry('section B1',
     <Entry>[
       new Entry('item B1.1'),
       new Entry('item B1.2'),
       new Entry('item B1.3'),
       new Entry('item B1.4')
     ])
   ])
];


 class EntryItem extends StatelessWidget{
   const EntryItem(this.entry);
   final Entry entry;

  Widget _buildTiles(Entry root){
    if(root.children.isEmpty)
       return new ListTile(title:new Text(root.title));
    return new ExpansionTile(
      key: new PageStorageKey<Entry>(root),
      title:new Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context){
    return _buildTiles(entry);
  }
 }