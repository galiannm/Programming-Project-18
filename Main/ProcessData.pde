//class ProcessData
//{
//  int theColumn;
//  ArrayList<String> data;
//  ArrayList<String> elemInColumn;
//  ArrayList<String> list;
//  String theElem;
//  ProcessData(ArrayList<String> list, int theColumn, String theElem)
//  {
//    this.theColumn = theColumn;
//    this.theElem = theElem;
//    this.list = list;
//    data = new ArrayList<>();
//    elemInColumn = new ArrayList<>();
//  }

//  ArrayList<String> getRelatedElem()
//  {
//    for (int i = 0; i < nbRows; i++)
//    {
//      for (int j = 0; j < nbColumns; i++)
//      {
//        if (fullFlightsData[j][theColumn].equalsIgnoreCase(theElem))
//        {
//          elemInColumn.add(table.getString(j, i));
//        }
//      }
//      data.addAll(elemInColumn);
//    }
//    return data;
//  }

//  ArrayList<String> getUniqueElemOfColumn()
//  {
//    for (int i = 0; i<nbRows; i++)
//    {
//      String elem = fullFlightsData[i][theColumn];
//      if (!data.contains(elem))
//      {
//        data.add(elem);
//      }
//    }
//    return data;
//  }
//}
