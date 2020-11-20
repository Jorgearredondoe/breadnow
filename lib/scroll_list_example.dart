                        Flexible(
                          flex:17,
                          child:ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (ctx,int){
                              return Card(
                                child: ListTile(
                                    title: Text('Motivation $int'),
                                    subtitle: Text('this is a description of the motivation')),
                            );
                                },
                                ),
                      ),