/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Mathew
 */
public class CheckIn {
    private int id, guestId, roomId;
    private String inTime, outTime;
    
    public int getId(){
        return id;
    }
    public int getGuestId(){
        return guestId;
    }
    public int getRoomId(){
        return roomId;
    }
    public String getCheckInTime(){
        return inTime;
    }
    public String getCheckOutTime(){
        return outTime;
    }
    public void setId(int idtfy){
        this.id = idtfy;
    }
    public void setGuestId(int gid){
        this.guestId = gid;
    }
    public void setRoomId(int rid){
        this.roomId = rid;
    }
    public void setCheckInTime(String cInTime){
        this.inTime = cInTime;
    }
    public void setCheckOutTime(String cOutTime){
        this.outTime = cOutTime;
    }
}
