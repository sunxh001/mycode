package dao.dataconnect;

import java.io.IOException;

import org.apache.ibatis.session.SqlSession;

import dao.mappers;

public class GetMapper {
	private SqlSession ss = null;

	public mappers mappers() {
		try {
			ss = ConnectionMysql.build().openSession(true);
		} catch (IOException e) {
			e.printStackTrace();
		}
		mappers m = ss.getMapper(mappers.class);
		return m;
	}

}
