package util;

import models.Dataset;

/**
 * Created by ethan on 4/18/16.
 */
public interface DatasetMemento {
    public long saveDatasetMemento(Dataset dataset);
    public Dataset getDatasetMemento(long id);
    public void deleteDatasetMemento(long id);
}
