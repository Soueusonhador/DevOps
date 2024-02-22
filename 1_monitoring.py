import time
import random

class Node:
    def __init__(self, ip, hostname):
        self.ip = ip
        self.hostname = hostname

    def collect_data(self):
        alerts = random.randint(0, 5)
        notifications = random.randint(0, 10)
        logs = random.randint(0, 20)
        return {
            "alerts": alerts,
            "notifications": notifications,
            "logs": logs
        }

class NodeMonitor:
    def __init__(self, nodes):
        self.nodes = nodes

    def collect_data_from_nodes(self):
        all_data = {}
        for node in self.nodes:
            data = node.collect_data()
            all_data[node.hostname] = data
        return all_data

    def analyze_data(self, data):
        critical_events = {}
        for node, values in data.items():
            total = sum(values.values())
            if total > 10:
                critical_events[node] = total
        return critical_events

    def display_critical_events(self, events):
        if not events:
            print("No critical events.")
        else:
            print("Critical events:")
            for node, total in events.items():
                print(f"Node: {node}, Total: {total}")

    def run(self):
        while True:
            data = self.collect_data_from_nodes()
            critical_events = self.analyze_data(data)
            self.display_critical_events(critical_events)
            time.sleep(5)

if __name__ == "__main__":
    nodes = [
        Node("192.168.1.1", "Node1"),
        Node("192.168.1.2", "Node2"),
        Node("192.168.1.3", "Node3")
    ]

    monitor = NodeMonitor(nodes)
    monitor.run()
