package model.room;

public class Room {
    private int roomNo;
    private String type;
    private double price;
    private boolean available;
    private int maxOccupants;

    public Room(int roomNo, String type, double price, boolean available, int maxOccupants) {
        this.roomNo = roomNo;
        this.type = type;
        this.price = price;
        this.available = available;
        this.maxOccupants = maxOccupants;
    }

    public int getMaxOccupants() {
        return maxOccupants;
    }



    public int getRoomNo() { return roomNo; }
    public String getType() { return type; }
    public double getPrice() { return price; }
    public boolean isAvailable() { return available; }

    public void setAvailable(boolean available) {
        this.available = available;
    }
}
