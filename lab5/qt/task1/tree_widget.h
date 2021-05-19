#ifndef LAB4_TREE_WIDGET_H_
#define LAB4_TREE_WIDGET_H_

#include <QTreeWidget>
#include <set>

class TreeWidget : public QTreeWidget {
	Q_OBJECT
private:
	QSet<QString> data_set;

	QPoint start_pos;
public:
	TreeWidget(QWidget* parent = nullptr);
	void AddPath(const std::string& str);
	const QSet<QString>& GetDataSet() const;
	void Clear();
	void addTopLevelItem(QTreeWidgetItem* item);
	void ItemUpdate(QTreeWidgetItem* item, QString& string);
private slots:
	void GetSelectedString();
	
	void ItemClicked(QTreeWidgetItem* item, int column);
signals:
	void PathAdded(int leaf_count);
	void SelectionChanged(const QString&);
};

#endif

