package ch.unibe.scg.pdflinker;

public class Pair<T1, T2> {

	private T1 v1;
	private T2 v2;

	public Pair(T1 v1, T2 v2) {
		this.v1 = v1;
		this.v2 = v2;
	}

	public T1 getV1() {
		return this.v1;
	}

	public void setV1(T1 v1) {
		this.v1 = v1;
	}

	public T2 getV2() {
		return this.v2;
	}

	public void setV2(T2 v2) {
		this.v2 = v2;
	}

}
