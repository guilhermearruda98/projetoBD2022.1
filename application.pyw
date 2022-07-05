import sys
from PyQt5 import QtWidgets, uic, QtCore
from PyQt5.QtWidgets import QFileDialog, QMessageBox, QTableWidget, QTableWidgetItem, QHeaderView
from database_driver import DatabaseDriver

class Ui(QtWidgets.QMainWindow):
    def __init__(self):
        super(Ui, self).__init__()
        uic.loadUi('vendas.ui', self)
        self.init_interface()
        self.show()
     
    
    def init_interface (self):
        '''
        Método utilizado para realizar a configuração inicial da interface
        '''
        self.payload = {
            "host":"localhost",
            "database":"projetomaiscor",
            "user":"userprojeto",
            "password":"User@123"
        }

        self.db = DatabaseDriver(**self.payload)
        
        self.pushButtonConsulta.clicked.connect(self.consultas)

    def consultas(self):
        
        if self.radioButton.isChecked():
            self.consultar_produto()
        else:
            self.tableConsulta.clear()

    def consultar_produto (self):

        produtos = self.db.consultar_produtos()
        if self.lineEditConsulta.text() != "":
            for produto in produtos:
                if str(produto[0]) == self.lineEditConsulta.text():
                    produtos = [produto]
                    break

        data = dict()
        labels = ["Código", "Fabricante", "Nome", "Valor", "Unidade", "Volume", "Cor", "Quantidade"]
        for i in range(len(labels)):
            data[labels[i]] = [j[i] for j in produtos] 
        self.update_tabela_consulta(data)

    def update_tabela_consulta (self, data):

        self.tableConsulta.clear()
        self.tableConsulta.setColumnCount(len(data)) 
        self.tableConsulta.setRowCount(len(data["Código"]))
        
        horHeaders = []
        for n, key in enumerate(sorted(data.keys())):
            horHeaders.append(key)
            for m, item in enumerate(data[key]):
                newitem = QTableWidgetItem(str(item))
                self.tableConsulta.setItem(m, n, newitem)
        self.tableConsulta.setHorizontalHeaderLabels(horHeaders)
        
        self.tableConsulta.resizeColumnsToContents()
        self.tableConsulta.resizeRowsToContents()
        self.tableConsulta.horizontalHeader().setStretchLastSection(True)
        self.tableConsulta.horizontalHeader().setSectionResizeMode(
            QHeaderView.Stretch)

def main ():
    app = QtWidgets.QApplication(sys.argv)
    window = Ui() 
    app.exec_()
    
if __name__ == "__main__":
    main()