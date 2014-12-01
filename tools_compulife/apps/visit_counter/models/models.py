from datetime import datetime
from sqlalchemy import Column, Integer, Unicode, DateTime, Date
from . import db, Base


class Visit(Base):
    "Page Visit"

    __tablename__ = 'visits'

    id = Column(Integer, primary_key=True)
    timestamp = Column(DateTime, default=datetime.utcnow)
    source_ip = Column(Unicode(50))
    user_agent = Column(Unicode(200))
    url = Column(Unicode(2000))


class History(Base):
    """
    Stores history of visits per day. It's intentionally created ignoring normalization
    as after a day passes it's visit count won't be changed so it's better to store it
    in history
    """

    __tablename__ = 'history'

    date = Column(Date, primary_key=True)
    url = Column(Unicode(2000), primary_key=True)
    visit_count = Column(Integer, default=0)


