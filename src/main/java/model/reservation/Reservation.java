package model.reservation;

public class Reservation implements Comparable<Reservation> {
    private String id;
    private String userId;
    private int roomNo;
    private String checkIn;
    private String checkOut;

    public Reservation(String id, String userId, int roomNo, String checkIn, String checkOut) {
        this.id = id;
        this.userId = userId;
        this.roomNo = roomNo;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
    }

    public String getId() { return id; }
    public String getUserId() { return userId; }
    public int getRoomNo() { return roomNo; }
    public String getCheckIn() { return checkIn; }
    public String getCheckOut() { return checkOut; }

    @Override
    public int compareTo(Reservation other) {
        return this.checkIn.compareTo(other.checkIn);
    }
}
