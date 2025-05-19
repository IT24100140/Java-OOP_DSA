package model.room;

import java.util.ArrayList;
import java.util.List;

public class RoomBST {

    private static class Node {
        Room data;
        Node left, right;

        Node(Room data) {
            this.data = data;
        }
    }

    private Node root;

    public void insert(Room room) {
        root = insertRec(root, room);
    }

    private Node insertRec(Node current, Room room) {
        if (current == null) return new Node(room);

        if (room.getRoomNo() < current.data.getRoomNo()) {
            current.left = insertRec(current.left, room);
        } else {
            current.right = insertRec(current.right, room);
        }
        return current;
    }

    public Room search(int roomNo) {
        return searchRec(root, roomNo);
    }

    private Room searchRec(Node current, int roomNo) {
        if (current == null) return null;

        if (roomNo == current.data.getRoomNo()) return current.data;
        return roomNo < current.data.getRoomNo()
                ? searchRec(current.left, roomNo)
                : searchRec(current.right, roomNo);
    }

    public List<Room> inOrder() {
        List<Room> list = new ArrayList<>();
        inOrderRec(root, list);
        return list;
    }

    private void inOrderRec(Node node, List<Room> list) {
        if (node != null) {
            inOrderRec(node.left, list);
            list.add(node.data);
            inOrderRec(node.right, list);
        }
    }
}
