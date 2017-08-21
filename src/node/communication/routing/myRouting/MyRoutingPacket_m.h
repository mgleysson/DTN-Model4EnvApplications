//
// Generated file, do not edit! Created by nedtool 4.6 from src/node/communication/routing/myRouting/MyRoutingPacket.msg.
//

#ifndef _MYROUTINGPACKET_M_H_
#define _MYROUTINGPACKET_M_H_

#include <omnetpp.h>

// nedtool version check
#define MSGC_VERSION 0x0406
#if (MSGC_VERSION!=OMNETPP_VERSION)
#    error Version mismatch! Probably this file was generated by an earlier version of nedtool: 'make clean' should help.
#endif



// cplusplus {{
#include "RoutingPacket_m.h"
// }}

/**
 * Enum generated from <tt>src/node/communication/routing/myRouting/MyRoutingPacket.msg:19</tt> by nedtool.
 * <pre>
 * enum MyRoutingPacketDef
 * {
 * 
 *     MPRINGS_DATA_PACKET = 1;
 *     MPRINGS_TOPOLOGY_SETUP_PACKET = 2;
 * }
 * </pre>
 */
enum MyRoutingPacketDef {
    MPRINGS_DATA_PACKET = 1,
    MPRINGS_TOPOLOGY_SETUP_PACKET = 2
};

/**
 * Class generated from <tt>src/node/communication/routing/myRouting/MyRoutingPacket.msg:24</tt> by nedtool.
 * <pre>
 * packet MyRoutingPacket extends RoutingPacket
 * {
 *     int MyRoutingPacketKind @enum(MyRoutingPacketDef);	// 1 byte
 *     int sinkID;			// 2 bytes
 *     int senderLevel;	// 1 byte
 * 
 * 	//DATA packet overhead contains all fields, making its total size 13 bytes
 * 	//SETUP packet does not contain sequence number field, making its size 12 bytes
 * }
 * </pre>
 */
class MyRoutingPacket : public ::RoutingPacket
{
  protected:
    int MyRoutingPacketKind_var;
    int sinkID_var;
    int senderLevel_var;

  private:
    void copy(const MyRoutingPacket& other);

  protected:
    // protected and unimplemented operator==(), to prevent accidental usage
    bool operator==(const MyRoutingPacket&);

  public:
    MyRoutingPacket(const char *name=NULL, int kind=0);
    MyRoutingPacket(const MyRoutingPacket& other);
    virtual ~MyRoutingPacket();
    MyRoutingPacket& operator=(const MyRoutingPacket& other);
    virtual MyRoutingPacket *dup() const {return new MyRoutingPacket(*this);}
    virtual void parsimPack(cCommBuffer *b);
    virtual void parsimUnpack(cCommBuffer *b);

    // field getter/setter methods
    virtual int getMyRoutingPacketKind() const;
    virtual void setMyRoutingPacketKind(int MyRoutingPacketKind);
    virtual int getSinkID() const;
    virtual void setSinkID(int sinkID);
    virtual int getSenderLevel() const;
    virtual void setSenderLevel(int senderLevel);
};

inline void doPacking(cCommBuffer *b, MyRoutingPacket& obj) {obj.parsimPack(b);}
inline void doUnpacking(cCommBuffer *b, MyRoutingPacket& obj) {obj.parsimUnpack(b);}


#endif // ifndef _MYROUTINGPACKET_M_H_
