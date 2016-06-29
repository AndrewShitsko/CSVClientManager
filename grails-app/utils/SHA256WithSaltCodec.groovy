import org.apache.commons.codec.binary.Hex

import java.security.MessageDigest

class SHA256WithSaltCodec {
    static encode = { target ->
        return Hex.encodeHexString(MessageDigest.getInstance("SHA-256").digest(target.getBytes("UTF-8")))
    }
}
