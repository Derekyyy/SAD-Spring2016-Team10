package util;

import models.DatasetLog;

/**
 * Created by ethan on 4/18/16.
 */
public interface DatasetLogMemento {
    public long saveDatasetLogMemento(DatasetLog datasetLog);
    public DatasetLog getDatasetLogMemento(long id);
    public void deleteDatasetLogMemento(long id);
}
