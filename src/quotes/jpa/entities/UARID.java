package quotes.jpa.entities;

public class UARID {
String userName;
int authorID;
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + authorID;
	result = prime * result + ((userName == null) ? 0 : userName.hashCode());
	return result;
}
@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	UARID other = (UARID) obj;
	if (authorID != other.authorID)
		return false;
	if (userName == null) {
		if (other.userName != null)
			return false;
	} else if (!userName.equals(other.userName))
		return false;
	return true;
}
}