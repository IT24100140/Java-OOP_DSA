package model.room;

import util.FileUtil;

import java.io.IOException;
import java.util.List;

public class RoomLoader {

    public static RoomBST loadAvailableRooms(String filePath) throws IOException {
        RoomBST bst = new RoomBST();
        List<String[]> lines = FileUtil.readAll(filePath);

        for (String[] row : lines) {
            if (row.length >= 5) { // Now expects 5 columns
                int roomNo = Integer.parseInt(row[0]);
                String type = row[1];
                double price = Double.parseDouble(row[2]);
                boolean available = Boolean.parseBoolean(row[3]);
                int maxOccupants = Integer.parseInt(row[4]);

                if (available) {
                    Room room = new Room(roomNo, type, price, true, maxOccupants);
                    bst.insert(room);
                }
            }
        }

        return bst;
    }
}
