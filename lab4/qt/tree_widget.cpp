#include "tree_widget.h"

#include <algorithm>
#include <stdexcept>
#include <string>
#include <sstream>

#include <QDebug>

TreeWidget::TreeWidget(QWidget* parent) :
	QTreeWidget(parent)
{
	headerItem()->setText(0, "Pathes");
	connect(this, &QTreeWidget::itemSelectionChanged,
			this, &TreeWidget::GetSelectedString);
}

void TreeWidget::AddPath(const std::string& path) {
	if (path == "") {
		return;
	}

	std::istringstream ss(path);
	std::string s_index;
	QString qs_index;

	QString result_string;

	QTreeWidgetItem* current_item = invisibleRootItem();
	while (ss >> s_index) {
		try {
			stoi(s_index);
		} catch (std::exception& e) {
			throw e;
		}

		qs_index = QString::fromUtf8(s_index.c_str());
		result_string += qs_index + ' ';
		if (data_set.contains(result_string)) {
			data_set.remove(result_string);
		}
		
		bool is_finded = false;
		QTreeWidgetItem* item;
		for (int i = 0; i < current_item->childCount(); i++) {
			item = current_item->child(i);
			if (item->text(0) == qs_index) {
				is_finded = true;
				current_item = item;
				break;
			}
		}
		if (!is_finded) {
			current_item = new QTreeWidgetItem(
					current_item, 
					QStringList(qs_index)
			);
		}
	}
	data_set.insert(result_string);
	emit PathAdded(data_set.size());
}

const QSet<QString>& TreeWidget::GetDataSet() const {
	return data_set;
}

void TreeWidget::Clear() {
	data_set.clear();
	clear();
}

void TreeWidget::GetSelectedString() {
	QString result_string;
	auto list = selectedItems();
	if (list.size() == 0) {
		return;
	}
	auto tree_item = selectedItems()[0];	
	while (tree_item != nullptr && tree_item->text(0) != "") {
		result_string += tree_item->text(0) + ' ';
		tree_item = tree_item->parent();
	}
	std::reverse(result_string.begin(), result_string.end());
	emit SelectionChanged(result_string);
}

