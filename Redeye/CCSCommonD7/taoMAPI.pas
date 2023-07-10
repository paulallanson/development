unit taoMAPI;

interface

const
{ Property Types from MAPIDEFS.H }
  PT_UNSPECIFIED = $0000; // ((ULONG)  0)     (Reserved for interface use) type doesn't matter to caller
  PT_NULL = $0001; // ((ULONG)  1)     NULL property value
  PT_I2 = $0002; // ((ULONG)  2)     Signed 16-bit value
  PT_LONG = $0003; // ((ULONG)  3)     Signed 32-bit value
  PT_R4 = $0004; // ((ULONG)  4)     4-byte floating point
  PT_DOUBLE = $0005; // ((ULONG)  5)     Floating point double
  PT_CURRENCY = $0006; // ((ULONG)  6)     Signed 64-bit int (decimal w/    4 digits right of decimal pt)
  PT_APPTIME = $0007; // ((ULONG)  7)     Application time
  PT_ERROR = $000A; // ((ULONG) 10)     32-bit error value
  PT_BOOLEAN = $000B; // ((ULONG) 11)     16-bit boolean (non-zero true)
  PT_OBJECT = $000D; // ((ULONG) 13)     Embedded object in a property
  PT_I8 = $0014; // ((ULONG) 20)     8-byte signed integer
  PT_STRING8 = $001E; // ((ULONG) 30)     Null terminated 8-bit character string
  PT_UNICODE = $001F; // ((ULONG) 31)     Null terminated Unicode string
  PT_SYSTIME = $0040; // ((ULONG) 64)     FILETIME 64-bit int w/ number of 100ns periods since Jan 1,1601
  PT_CLSID = $0048; // ((ULONG) 72)     OLE GUID
  PT_BINARY = $0102; // ((ULONG) 258)    Uninterpreted (counted byte array)

// PT_TSTRING is either PT_STRING8 or PT_UNICODE depending on the platform.

{ Alternate property type names for ease of use
#define PT_SHORT    PT_I2
#define PT_I4       PT_LONG
#define PT_FLOAT    PT_R4
#define PT_R8       PT_DOUBLE
#define PT_LONGLONG PT_I8 }

{ MAPI Properties from MAPITAGS.H }
  PR_TRANSPORT_MESSAGE_HEADERS = $007D; // PT_TSTRING. The property contains transport-specific message envelope information.

  PR_RECEIVED_BY_NAME = $0040; // PT_TSTRING. The property contains the display name of the messaging user that actually receives the message.
  PR_RCVD_REPRESENTING_NAME = $0044; // PT_TSTRING. The property contains the display name for the messaging user represented by the receiving user.
  PR_RECEIVED_BY_ADDRTYPE = $0075; // PT_TSTRING. The property contains the e-mail address type, such as SMTP, for the messaging user that actually receives the message.
  PR_RECEIVED_BY_EMAIL_ADDRESS = $0076; // PT_TSTRING. The property contains the e-mail address for the messaging user that actually receives the message.
  PR_RCVD_REPRESENTING_ADDRTYPE = $0077; // PT_TSTRING. The property contains the address type for the messaging user represented by the user actually receiving the message.
  PR_RCVD_REPRESENTING_EMAIL_ADDRESS = $0078; // PT_TSTRING. The property contains the e-mail address for the messaging user represented by the receiving user.

  PR_SENT_REPRESENTING_NAME = $0042; // PT_TSTRING. The property contains the display name for the messaging user represented by the sender.
  PR_SENT_REPRESENTING_ADDRTYPE = $0064; // PT_TSTRING. The property contains the address type for the messaging user represented by the sender.
  PR_SENT_REPRESENTING_EMAIL_ADDRESS = $0065; // PT_TSTRING. The property contains the e-mail address for the messaging user represented by the sender.
  PR_SENDER_NAME = $0C1A; // PT_TSTRING. The property contains the message sender's display name.
  PR_SENDER_ADDRTYPE = $0C1E; // PT_TSTRING. The property contains the message sender's e-mail address type.
  PR_SENDER_EMAIL_ADDRESS = $0C1F; // PT_TSTRING. The property contains the message sender's e-mail address.

  PR_REPLY_RECIPIENT_NAMES = $0050; // PT_TSTRING. The property contains a list of display names for recipients that are to get a reply.

  PR_DISPLAY_BCC = $0E02; // PT_TSTRING. The property contains an ASCII list of the display names of any blind carbon copy (BCC) message recipients, separated by semicolons (;).
  PR_DISPLAY_CC = $0E03; // PT_TSTRING. The property contains an ASCII list of the display names of any carbon copy (CC) message recipients, separated by semicolons (;).
  PR_DISPLAY_TO = $0E04; // PT_TSTRING. The property contains an ASCII list of the display names of the primary (To) message recipients, separated by semicolons (;).

  PR_DISPLAY_NAME = $3001; // PT_TSTRING. The property contains the display name for a given MAPI object.
  PR_EMAIL_ADDRESS = $3003; // PT_TSTRING. The property contains the messaging user's e-mail address.
  PR_7BIT_DISPLAY_NAME = $39FF; // PT_TSTRING. The property contains a 7-bit ASCII version of a messaging user's name.
  PR_TRANSMITABLE_DISPLAY_NAME = $3A20; // PT_TSTRING. The property contains a recipient's display name in a secure form that cannot be changed.

  PR_RECIPIENT_TYPE = $0C15; // PT_TSTRING. The property contains the recipient type for a message recipient. MAPI_TO, MAPI_CC, MAPI_BCC, and so on.
(* in ...\Source\Rtl\Win\Mapi.pas
  MAPI_ORIG = 0;                { Recipient is message originator          }
  MAPI_TO = 1;                  { Recipient is a primary recipient         }
  MAPI_CC = 2;                  { Recipient is a copy recipient            }
  MAPI_BCC = 3;                 { Recipient is blind copy recipient        } *)

  PR_BODY = $1000; // PT_TSTRING. The property contains the message text. The value must be expressed in the code page of the operating system that MAPI is running on.

  PR_ATTACH_SIZE = $0E20; // PT_LONG. The property contains the sum, in bytes, of the sizes of all properties on an attachment.
  PR_ATTACH_NUM = $0E21; // PT_LONG. The property contains a number that uniquely identifies the attachment within its parent message.
  PR_ATTACH_METHOD = $3705; // PT_LONG. The property contains a MAPI-defined constant representing the way the contents of an attachment can be accessed.

  PR_MESSAGE_CLASS = $001A; // PT_TSTRING. The property contains a text string that identifies the sender-defined message class, such as IPM.Note.

  PR_SUBJECT = $0037; // PT_TSTRING. The property contains the full subject of a message.
  PR_SUBJECT_PREFIX = $003D; // PT_TSTRING. The property contains a subject prefix that typically indicates some action on a message, such as "FW: " for forwarding.
  PR_CONVERSATION_TOPIC  = $0070; // PT_TSTRING. The property contains the topic of the first message in a conversation thread.
  PR_NORMALIZED_SUBJECT = $0E1D; // PT_TSTRING. The property contains the message subject with any prefix removed.

  PR_SMTP_MESSAGE_ID = $1035; // PT_TSTRING.

  PR_ADDRTYPE  = $3002; // PT_TSTRING. The property contains the messaging user's e-mail address type, such as SMTP.
  PR_LAST_MODIFIER_NAME = $3FFA; // PT_TSTRING.
  PR_REPLY_RECIPIENT_SMTP_PROXIES = $3FFC; // PT_TSTRING.
  PR_ORG_ADDR_TYPE = $403D; // PT_TSTRING.
  PR_ORG_EMAIL_ADDR = $403E; // PT_TSTRING.

  PR_RECORD_KEY = $0FF9; // PT_BINARY The property contains a unique binary-comparable identifier for a specific object.
  PR_ATTACH_DATA_OBJ = $3701; // PT_BINARY The property contains an attachment object typically accessed through the OLE IStorage interface.
  PR_ATTACH_FILENAME = $3704; // PT_TSTRING The property contains an attachment's base filename and extension, excluding path.
  PR_ATTACH_LONG_FILENAME = $3707; // PT_TSTRING The property contains an attachment's long filename and extension, excluding path.
  PR_ATTACH_TAG = $370A; // PT_BINARY The property contains an ASN.1 object identifier specifying the application that supplied an attachment.
  PR_ATTACH_MIME_TAG = $370E; // PT_TSTRING The property contains formatting information about a Multipurpose Internet Mail Extensions (MIME) attachment.

  PR_INSTANCE_KEY = $0FF6; // PT_BINARY The property contains a value that uniquely identifies a row in a table.
  PR_ENTRYID = $0FFF; // PT_BINARY The property contains a MAPI entry identifier used to open and edit properties of a particular MAPI object.
  PR_SEARCH_KEY = $300B; // PT_BINARY The property contains a binary-comparable key that identifies correlated objects for a search.

  PR_LAST_MODIFICATION_TIME = $3008; // PT_SYSTIME The property contains the date and time the object or subobject was last modified.

implementation

end.

